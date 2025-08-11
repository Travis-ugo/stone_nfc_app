part of 'home_bloc.dart';

/// {@template home_status}
/// Status of the home page
/// {@endtemplate}
enum HomeStatus {
  /// Initial state
  initial,

  /// Loading state
  loading,

  /// Success state
  success,

  /// Failure state
  failure,
}

/// {@template home_state}
/// State of the home page
/// {@endtemplate}
final class HomeState extends Equatable {
  /// {@macro home_state}
  const HomeState({
    this.status = HomeStatus.initial,
    this.uploadStatus = UploadStatus.initial,
    this.uploadProgress = 0.0,
    this.video,
    this.errorMessage,
    this.lastGeneratedNfcToken,
  });

  /// The current status
  final HomeStatus status;

  final UploadStatus uploadStatus;

  /// 0.0 - 1.0 progress for current upload
  final double uploadProgress;

  /// The single video currently loaded/displayed
  final VideoEntity? video;

  /// Error message if any
  final String? errorMessage;

  /// Last NFC token that was generated upon upload, if any
  final String? lastGeneratedNfcToken;

  /// Whether the home page is loading
  bool get isLoading => status == HomeStatus.loading;

  /// Whether the home page has loaded successfully
  bool get isSuccess => status == HomeStatus.success;

  /// Whether the home page has failed to load
  bool get isFailure => status == HomeStatus.failure;

  bool get uploadIsLoading => status == HomeStatus.loading;

  /// Whether the home page has loaded successfully
  bool get uploadIsSuccess => status == HomeStatus.success;

  /// Whether the home page has failed to load
  bool get uploadIsFailure => status == HomeStatus.failure;

  /// Whether there is a video available
  bool get hasVideo => video != null;

  /// Whether there is any watch history

  // /// Get recent watch history (last 5)
  // List<WatchHistoryEntity> get recentWatchHistory =>
  //     watchHistory.take(5).toList();

  /// Create a copy of this state with given fields replaced
  HomeState copyWith({
    HomeStatus? status,
    UploadStatus? uploadStatus,
    double? uploadProgress,
    VideoEntity? video,
    String? errorMessage,
    String? lastGeneratedNfcToken,
  }) {
    return HomeState(
      status: status ?? this.status,
      uploadStatus: uploadStatus ?? this.uploadStatus,
      uploadProgress: uploadProgress ?? this.uploadProgress,
      video: video ?? this.video,
      errorMessage: errorMessage ?? this.errorMessage,
      lastGeneratedNfcToken: lastGeneratedNfcToken ?? this.lastGeneratedNfcToken,
    );
  }

  @override
  List<Object?> get props => [status, video, errorMessage, lastGeneratedNfcToken, uploadProgress];
}

enum UploadStatus {
  /// Initial state
  initial,

  /// Loading state
  loading,

  /// Success state
  success,

  /// Failure state
  failure,
}
