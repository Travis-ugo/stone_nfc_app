import 'package:dartz/dartz.dart'; 
import 'package:storage_repository/src/domain/repository/storage_repository.dart';
import 'package:storage_repository/storage_repository.dart';

class StorageRepositoryImpl implements StorageRepository {
  StorageRepositoryImpl({required this.storageDataSourceImpl});

  final StorageDataSourceImpl storageDataSourceImpl;

  @override
  Future<Either<String, UserProfileEntity?>> getUserProfile({
    required String userId,
  }) async {
    try {
      final profileModel = await storageDataSourceImpl.getUserProfile(
        userId: userId,
      );
      if (profileModel == null) return const Right(null);
      return Right(profileModel.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, UserProfileEntity>> saveUserProfile({
    required UserProfileEntity profile,
  }) async {
    try {
      final savedModel = await storageDataSourceImpl.saveUserProfile(
        profile: profile.toModel(),
      );
      return Right(savedModel.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> updateUserProfile({
    required UserProfileEntity profile,
  }) async {
    try {
      await storageDataSourceImpl.updateUserProfile(profile: profile.toModel());
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> deleteUserProfile({
    required String userId,
  }) async {
    try {
      await storageDataSourceImpl.deleteUserProfile(userId: userId);
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, String>> uploadVideoWithToken({
    required String videoFilePath,
    required String thumbnailFilePath,
    required String title,
    String? branding,
    String? description,
    int? duration,
    bool isImage = false,
    void Function(double progress)? onProgress,
  }) async {
   
    try {
      final token = await storageDataSourceImpl.uploadVideoWithToken(
        videoFilePath: videoFilePath,
        thumbnailFilePath: thumbnailFilePath,
        title: title,
        branding: branding,
        description: description,
        duration: duration,
        isImage: isImage,
        onProgress: onProgress,
      );
      return Right(token);
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, VideoEntity?>> getVideoByToken({
    required String nfcToken,
  }) async {
    try {
      final model = await storageDataSourceImpl.getVideoByToken(
        nfcToken: nfcToken,
      );
      if (model == null) return const Right(null);
      return Right(model.toEntity());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, List<WatchHistoryEntity>>> getUserWatchHistory({
    required String userId,
  }) async {
    try {
      final models = await storageDataSourceImpl.getUserWatchHistory(
        userId: userId,
      );
      return Right(models.toEntityList());
    } catch (e) {
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, WatchHistoryEntity>> addWatchHistory({
    required WatchHistoryEntity history,
  }) async {
    try {
      final model = history.toModel();
      final savedModel = await storageDataSourceImpl.addWatchHistory(
        history: model,
      );
          print('ADDED TO HISTORY');
      return Right(savedModel.toEntity());
    } catch (e) {
       print('FAILED TO ADD TO WATCHED HISTORY');
      return Left(e.toString());
    }
  }

  @override
  Future<Either<String, bool>> updateWatchHistory({
    required WatchHistoryEntity history,
  }) async {
    try {
      final model = history.toModel();
      await storageDataSourceImpl.updateWatchHistory(history: model);
      return const Right(true);
    } catch (e) {
      return Left(e.toString());
    }
  }
}
