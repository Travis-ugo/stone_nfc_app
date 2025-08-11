// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchHistoryModel _$WatchHistoryModelFromJson(Map<String, dynamic> json) =>
    _WatchHistoryModel(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      video: VideoModel.fromJson(json['video'] as Map<String, dynamic>),
      viewedAt: const TimestampConverter().fromJson(json['viewed_at']),
      watchDuration: (json['watch_duration'] as num?)?.toInt(),
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$WatchHistoryModelToJson(_WatchHistoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'video': instance.video.toJson(),
      'viewed_at': const TimestampConverter().toJson(instance.viewedAt),
      'watch_duration': instance.watchDuration,
      'completed': instance.completed,
    };
