part of 'watched_history_bloc.dart';

class WatchedHistoryState extends Equatable {
  const WatchedHistoryState({
    this.historyStatus = HistoryStatus.initial,
    this.watchHistory = const [],
    this.errorMessage,
  });

  /// User's watch history
  final List<WatchHistoryEntity> watchHistory;

  final HistoryStatus historyStatus;

  /// Error message if any
  final String? errorMessage;

  bool get isLoading => historyStatus == HistoryStatus.loading;

  /// Whether the home page has loaded successfully
  bool get isSuccess => historyStatus == HistoryStatus.success;

  /// Whether the home page has failed to load
  bool get isFailure => historyStatus == HistoryStatus.failure;

  bool get hasWatchHistory => watchHistory.isNotEmpty;
  @override
  List<Object?> get props => [historyStatus, watchHistory, errorMessage];
  WatchedHistoryState copyWith({
    List<WatchHistoryEntity>? watchHistory,
    HistoryStatus? historyStatus,
    String? errorMessage,
  }) {
    return WatchedHistoryState(
      watchHistory: watchHistory ?? this.watchHistory,
      historyStatus: historyStatus ?? this.historyStatus,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}

final class WatchedHistoryInitial extends WatchedHistoryState {}

enum HistoryStatus {
  /// Initial state
  initial,

  /// Loading state
  loading,

  /// Success state
  success,

  /// Failure state
  failure,
}
