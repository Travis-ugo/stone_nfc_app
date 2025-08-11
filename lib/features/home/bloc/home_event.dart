part of 'home_bloc.dart';

/// {@template home_event}
/// Base class for all home events
/// {@endtemplate}
sealed class HomeEvent extends Equatable {
  /// {@macro home_event}
  const HomeEvent();

  @override
  List<Object> get props => [];
}

final class HomeVideosRequested extends HomeEvent {
  /// {@macro home_videos_requested}
  const HomeVideosRequested({required this.nfcToken});

  final String nfcToken;
}

final class UploadMedia extends HomeEvent {
  /// {@macro home_videos_requested}
  const UploadMedia({required this.file});

  final File file;
}
