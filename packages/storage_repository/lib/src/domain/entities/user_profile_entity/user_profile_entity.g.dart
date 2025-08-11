// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileEntity _$UserProfileEntityFromJson(
  Map<String, dynamic> json,
) => _UserProfileEntity(
  userId: json['userId'] as String,
  displayName: json['displayName'] as String?,
  email: json['email'] as String?,
  photoUrl: json['photoUrl'] as String?,
  phoneNumber: json['phoneNumber'] as String?,
  dateOfBirth: const TimestampDateTimeConverter().fromJson(json['dateOfBirth']),
  gender: json['gender'] as String?,
  createdAt: const TimestampDateTimeConverter().fromJson(json['createdAt']),
  updatedAt: const TimestampDateTimeConverter().fromJson(json['updatedAt']),
  lastLoginAt: const TimestampDateTimeConverter().fromJson(json['lastLoginAt']),
);

Map<String, dynamic> _$UserProfileEntityToJson(
  _UserProfileEntity instance,
) => <String, dynamic>{
  'userId': instance.userId,
  'displayName': instance.displayName,
  'email': instance.email,
  'photoUrl': instance.photoUrl,
  'phoneNumber': instance.phoneNumber,
  'dateOfBirth': const TimestampDateTimeConverter().toJson(
    instance.dateOfBirth,
  ),
  'gender': instance.gender,
  'createdAt': const TimestampDateTimeConverter().toJson(instance.createdAt),
  'updatedAt': const TimestampDateTimeConverter().toJson(instance.updatedAt),
  'lastLoginAt': const TimestampDateTimeConverter().toJson(
    instance.lastLoginAt,
  ),
};
