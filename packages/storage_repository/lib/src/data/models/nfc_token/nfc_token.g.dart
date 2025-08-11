// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nfc_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NFCTokenModel _$NFCTokenModelFromJson(Map<String, dynamic> json) =>
    _NFCTokenModel(
      tagId: json['tag_id'] as String,
      videoId: json['video_id'] as String,
      expiresAt: const TimestampConverter().fromJson(json['expires_at']),
      isActive: json['is_active'] as bool? ?? true,
      createdAt: const TimestampConverter().fromJson(json['created_at']),
      updatedAt: const TimestampConverter().fromJson(json['updated_at']),
    );

Map<String, dynamic> _$NFCTokenModelToJson(_NFCTokenModel instance) =>
    <String, dynamic>{
      'tag_id': instance.tagId,
      'video_id': instance.videoId,
      'expires_at': const TimestampConverter().toJson(instance.expiresAt),
      'is_active': instance.isActive,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
    };
