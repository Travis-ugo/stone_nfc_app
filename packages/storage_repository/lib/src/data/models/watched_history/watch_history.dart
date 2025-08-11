import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storage_repository/storage_repository.dart';

part 'watch_history.freezed.dart';
part 'watch_history.g.dart';

/// {@template watch_history}
/// Watch History model representing a user's video viewing record
/// {@endtemplate}
@freezed
abstract class WatchHistoryModel with _$WatchHistoryModel {
  /// {@macro watch_history}
  @JsonSerializable(explicitToJson: true)
  const factory WatchHistoryModel({
    /// Unique identifier for the watch history record
    String? id,

    /// ID of the user who watched the video
    @JsonKey(name: 'user_id') required String userId,

    required VideoModel video,

    /// When the video was viewed
    @JsonKey(name: 'viewed_at') @TimestampConverter() Timestamp? viewedAt,

    /// Duration watched in seconds
    @JsonKey(name: 'watch_duration') int? watchDuration,

    /// Whether the video was completed
    @Default(false) bool completed,
  }) = _WatchHistoryModel;

  /// Create a WatchHistory from JSON
  factory WatchHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$WatchHistoryModelFromJson(json);

  /// Create from Firestore document
  factory WatchHistoryModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return WatchHistoryModel.fromJson({'id': doc.id, ...data});
  }
}
