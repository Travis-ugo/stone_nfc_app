// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfc_token_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NFCTokenEntity _$NFCTokenEntityFromJson(Map<String, dynamic> json) =>
    _NFCTokenEntity(
      tagId: json['tagId'] as String,
      videoId: json['video_id'] as String,
      expiresAt: const TimestampDateTimeConverter().fromJson(json['expiresAt']),
      isActive: json['is_active'] as bool? ?? true,
      createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
      updatedAt: const TimestampDateTimeConverter().fromJson(json['updatedAt']),
    );

Map<String, dynamic> _$NFCTokenEntityToJson(
  _NFCTokenEntity instance,
) => <String, dynamic>{
  'tagId': instance.tagId,
  'video_id': instance.videoId,
  'expiresAt': const TimestampDateTimeConverter().toJson(instance.expiresAt),
  'is_active': instance.isActive,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampDateTimeConverter().toJson(instance.updatedAt),
};
