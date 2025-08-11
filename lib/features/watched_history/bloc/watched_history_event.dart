part of 'watched_history_bloc.dart';

sealed class WatchedHistoryEvent extends Equatable {
  const WatchedHistoryEvent();

  @override
  List<Object> get props => [];
}

/// {@template home_watch_history_requested}
/// Event fired when watch history is requested
/// {@endtemplate}
final class WatchHistoryRequested extends WatchedHistoryEvent {
  /// {@macro home_watch_history_requested}
  const WatchHistoryRequested({required this.userId});

  /// The user ID to get watch history for
  final String userId;

  @override
  List<Object> get props => [userId];
}

/// {@template home_video_played}
/// Event fired when a video is played
/// {@endtemplate}
final class VideoPlayed extends WatchedHistoryEvent {
  /// {@macro home_video_played}
  const VideoPlayed({required this.userId, required this.video});

  /// The user ID who played the video
  final String userId;

  /// The ID of the video that was played
  final VideoEntity video;

  @override
  List<Object> get props => [userId, video];
}
