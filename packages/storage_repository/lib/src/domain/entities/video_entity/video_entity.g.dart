// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VideoEntity _$VideoEntityFromJson(Map<String, dynamic> json) => _VideoEntity(
  videoId: json['videoId'] as String,
  title: json['title'] as String,
  url: json['url'] as String,
  branding: json['branding'] as String?,
  description: json['description'] as String?,
  thumbnailUrl: json['thumbnail_url'] as String?,
  duration: (json['duration'] as num?)?.toInt(),
  createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampDateTimeConverter().fromJson(json['updatedAt']),
);

Map<String, dynamic> _$VideoEntityToJson(
  _VideoEntity instance,
) => <String, dynamic>{
  'videoId': instance.videoId,
  'title': instance.title,
  'url': instance.url,
  'branding': instance.branding,
  'description': instance.description,
  'thumbnail_url': instance.thumbnailUrl,
  'duration': instance.duration,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampDateTimeConverter().toJson(instance.updatedAt),
};
