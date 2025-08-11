// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch_history_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchHistoryEntity _$WatchHistoryEntityFromJson(Map<String, dynamic> json) =>
    _WatchHistoryEntity(
      id: json['id'] as String?,
      userId: json['user_id'] as String,
      viewedAt: _fromTimestamp(json['viewed_at']),
      watchDuration: (json['watch_duration'] as num?)?.toInt(),
      completed: json['completed'] as bool? ?? false,
      video: VideoEntity.fromJson(json['video'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchHistoryEntityToJson(_WatchHistoryEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'viewed_at': _toTimestamp(instance.viewedAt),
      'watch_duration': instance.watchDuration,
      'completed': instance.completed,
      'video': instance.video,
    };
