// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoModel _$VideoModelFromJson(Map<String, dynamic> json) => _VideoModel(
  videoId: json['video_id'] as String,
  title: json['title'] as String,
  url: json['url'] as String,
  branding: json['branding'] as String?,
  description: json['description'] as String?,
  thumbnailUrl: json['thumbnail_url'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  createdAt: const TimestampConverter().fromJson(json['created_at']),
  updatedAt: const TimestampConverter().fromJson(json['updated_at']),
);

Map<String, dynamic> _$VideoModelToJson(_VideoModel instance) =>
    <String, dynamic>{
      'video_id': instance.videoId,
      'title': instance.title,
      'url': instance.url,
      'branding': instance.branding,
      'description': instance.description,
      'thumbnail_url': instance.thumbnailUrl,
      'duration': instance.duration,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
