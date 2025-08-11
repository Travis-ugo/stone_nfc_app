import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storage_repository/storage_repository.dart';

part 'watch_history_entity.freezed.dart';
part 'watch_history_entity.g.dart';

/// {@template watch_history_entity}
/// Watch History entity representing a watch history document in Firestore
/// {@endtemplate}
@freezed
abstract class WatchHistoryEntity with _$WatchHistoryEntity {
  const factory WatchHistoryEntity({
    /// Unique identifier for the watch history record
    String? id,

    /// ID of the user who watched the video
    @JsonKey(name: 'user_id') required String userId,

    /// When the video was viewed (stored as Timestamp in Firestore)
    @JsonKey(name: 'viewed_at', fromJson: _fromTimestamp, toJson: _toTimestamp)
    @TimestampConverter()
    required DateTime viewedAt,

    /// Duration watched in seconds
    @JsonKey(name: 'watch_duration') int? watchDuration,

    /// Whether the video was completed
    @Default(false) bool completed,

    required VideoEntity video,
  }) = _WatchHistoryEntity;

  factory WatchHistoryEntity.fromJson(Map<String, dynamic> json) =>
      _$WatchHistoryEntityFromJson(json);
}

/// Helper: Convert Firestore Timestamp → DateTime
DateTime _fromTimestamp(dynamic value) {
  if (value is Timestamp) return value.toDate();
  if (value is DateTime) return value;
  return DateTime.now();
}

/// Helper: Convert DateTime → Firestore Timestamp
Timestamp _toTimestamp(DateTime date) => Timestamp.fromDate(date);
