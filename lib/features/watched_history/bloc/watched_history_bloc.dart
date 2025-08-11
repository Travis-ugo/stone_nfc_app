import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:storage_repository/storage_repository.dart';

part 'watched_history_event.dart';
part 'watched_history_state.dart';

class WatchedHistoryBloc
    extends Bloc<WatchedHistoryEvent, WatchedHistoryState> {
  WatchedHistoryBloc({required StorageRepositoryImpl storageRepository})
    : _storageRepository = storageRepository,
      super(WatchedHistoryInitial()) {
    on<WatchHistoryRequested>(_onWatchHistoryRequested);
    on<VideoPlayed>(_onVideoPlayed);
  }

  final StorageRepositoryImpl _storageRepository;

  Future<void> _onWatchHistoryRequested(
    WatchHistoryRequested event,
    Emitter<WatchedHistoryState> emit,
  ) async {
    try {
      final result = await _storageRepository.getUserWatchHistory(
        userId: event.userId,
      );
      result.fold(
        (failure) {
          emit(
            state.copyWith(
              historyStatus: HistoryStatus.failure,
              errorMessage: failure.toString(),
            ),
          );
        },
        (watchHistory) {
          emit(
            state.copyWith(
              watchHistory: watchHistory,
              historyStatus: HistoryStatus.success,
            ),
          );
        },
      );
    } catch (error) {
      emit(
        state.copyWith(
          historyStatus: HistoryStatus.failure,
          errorMessage: error.toString(),
        ),
      );
    }
  }

  Future<void> _onVideoPlayed(
    VideoPlayed event,
    Emitter<WatchedHistoryState> emit,
  ) async {
    try {
      // 1️⃣ Get existing history first
      final existingHistoryResult = await _storageRepository
          .getUserWatchHistory(userId: event.userId);

      bool alreadyExists = false;
      existingHistoryResult.fold((_) {}, (historyList) {
        alreadyExists = historyList.any(
          (item) => item.video.videoId == event.video.videoId,
        );
      });

      // 2️⃣ Skip adding if already exists
      if (alreadyExists) {
        print('Video already in watch history, skipping add.');
        return;
      }

      // 3️⃣ Add watch history record
      final watchHistory = WatchHistoryEntity(
        userId: event.userId,
        video: event.video,
        viewedAt: DateTime.now(),
        completed: false,
      );

      await _storageRepository.addWatchHistory(history: watchHistory);

      // 4️⃣ Refresh history
      add(WatchHistoryRequested(userId: event.userId));
    } catch (error) {
      emit(state.copyWith(errorMessage: error.toString()));
    }
  }
}
