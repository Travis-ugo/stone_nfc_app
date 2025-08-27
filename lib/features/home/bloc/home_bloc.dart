import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:video_compress/video_compress.dart';

part 'home_event.dart';
part 'home_state.dart';

/// {@template home_bloc}
/// Bloc which manages the home page state and data operations
/// {@endtemplate}
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  /// {@macro home_bloc}
  HomeBloc({required StorageRepositoryImpl storageRepository})
    : _storageRepository = storageRepository,
      super(const HomeState()) {
    on<HomeVideosRequested>(_onVideosRequested);
    on<UploadMedia>(_onUploadMedia);
  }

  final StorageRepositoryImpl _storageRepository;

  Future<void> _onVideosRequested(
    HomeVideosRequested event,
    Emitter<HomeState> emit,
  ) async {
    emit(state.copyWith(status: HomeStatus.loading)); 
    try {
      final result = await _storageRepository.getVideoByToken(
        nfcToken: event.nfcToken,
      ); 
      result.fold(
        (failure) {
          print('failure: $failure');
          emit(
            state.copyWith(
              status: HomeStatus.failure,
              errorMessage: failure.toString(),
            ),
          );
        },
        (video) {
          print('video: $video');
          emit(state.copyWith(status: HomeStatus.success, video: video));
        },
      );
    } catch (error) {
      emit(
        state.copyWith(
          status: HomeStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onUploadMedia(
    UploadMedia event,
    Emitter<HomeState> emit,
  ) async {
    emit(
      state.copyWith(
        status: HomeStatus.loading,
        uploadStatus: UploadStatus.loading,
        uploadProgress: 0.0,
      ),
    );
    bool compressionStarted = false;
    String? generatedToken;

    try {
      final mimeType = lookupMimeType(event.file.path);
      if (mimeType == null) {
        emit(
          state.copyWith(
            uploadStatus: UploadStatus.failure,
            errorMessage: 'Cannot determine file type',
          ),
        );
        return;
      }

      if (mimeType.startsWith('video/')) {
        // Step 1: Compress video
        final compressedVideo = await VideoCompress.compressVideo(
          event.file.path,
          quality: VideoQuality.MediumQuality,
          deleteOrigin: false,
        );
        compressionStarted = true;

        if (compressedVideo?.file == null) {
          emit(
            state.copyWith(
              uploadStatus: UploadStatus.failure,
              errorMessage: 'Video compression failed or returned no file',
            ),
          );
          return;
        }

        final compressedVideoPath = compressedVideo!.file!.path;

        // Step 2: Generate thumbnail
        final thumbnailFile = await VideoCompress.getFileThumbnail(
          compressedVideoPath,
        );

        if (!await thumbnailFile.exists()) {
          emit(
            state.copyWith(
              uploadStatus: UploadStatus.failure,
              errorMessage: 'Failed to generate or find video thumbnail',
            ),
          );
          return;
        }

        // Small delay to ensure file write completion
        await Future.delayed(const Duration(milliseconds: 200));

        // Step 3: Upload video and thumbnail
        final uploadResult = await _storageRepository.uploadVideoWithToken(
          videoFilePath: compressedVideoPath,
          thumbnailFilePath: thumbnailFile.path,
          title: 'new upload',
          isImage: false,
          onProgress: (p) => emit(state.copyWith(uploadProgress: p)),
        );
        uploadResult.fold(
          (failure) => emit(
            state.copyWith(
              uploadStatus: UploadStatus.failure,
              errorMessage: failure,
            ),
          ),
          (token) => generatedToken = token,
        );
      } else if (mimeType.startsWith('image/')) {
        // Step 1: Generate image thumbnail
        final thumbnailFile = await _createImageThumbnail(event.file);

        if (!await File(thumbnailFile.path).exists()) {
          emit(
            state.copyWith(
              uploadStatus: UploadStatus.failure,
              errorMessage: 'Failed to create image thumbnail',
            ),
          );
          return;
        }

        // Step 2: Upload image and thumbnail
        final uploadResult = await _storageRepository.uploadVideoWithToken(
          videoFilePath: event.file.path,
          thumbnailFilePath: thumbnailFile.path,
          title: 'new image upload',
          isImage: true,
          onProgress: (p) => emit(state.copyWith(uploadProgress: p)),
        );
        uploadResult.fold(
          (failure) => emit(
            state.copyWith(
              uploadStatus: UploadStatus.failure,
              errorMessage: failure,
            ),
          ),
          (token) => generatedToken = token,
        );
      } else {
        emit(
          state.copyWith(
            uploadStatus: UploadStatus.failure,
            errorMessage: 'Unsupported file type: $mimeType',
          ),
        );
        return;
      }
      emit(
        state.copyWith(
          uploadStatus: UploadStatus.success,
          lastGeneratedNfcToken: generatedToken,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          uploadStatus: UploadStatus.failure,
          errorMessage: e.toString(),
        ),
      );
    } finally {
      if (compressionStarted) {
        await VideoCompress.cancelCompression();
      }
    }
  }

  Future<XFile> _createImageThumbnail(File originalImageFile) async {
    final dir = await getTemporaryDirectory();
    final targetPath =
        '${dir.path}/thumb_${DateTime.now().millisecondsSinceEpoch}.jpg';

    final XFile? result = await FlutterImageCompress.compressAndGetFile(
      originalImageFile.path,
      targetPath,
      quality: 50,
      minWidth: 200,
      minHeight: 200,
    );

    if (result == null) {
      throw Exception('Failed to create image thumbnail');
    }

    return result;
  }
}
