// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    _UserProfileModel(
      userId: json['user_id'] as String,
      displayName: json['display_name'] as String?,
      email: json['email'] as String?,
      photoUrl: json['photo_url'] as String?,
      phoneNumber: json['phone_number'] as String?,
      dateOfBirth: const TimestampConverter().fromJson(json['date_of_birth']),
      gender: json['gender'] as String?,
      preferences: json['preferences'] as Map<String, dynamic>?,
      createdAt: const TimestampConverter().fromJson(json['created_at']),
      updatedAt: const TimestampConverter().fromJson(json['updated_at']),
      lastLoginAt: const TimestampConverter().fromJson(json['last_login_at']),
    );

Map<String, dynamic> _$UserProfileModelToJson(_UserProfileModel instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'display_name': instance.displayName,
      'email': instance.email,
      'photo_url': instance.photoUrl,
      'phone_number': instance.phoneNumber,
      'date_of_birth': const TimestampConverter().toJson(instance.dateOfBirth),
      'gender': instance.gender,
      'preferences': instance.preferences,
      'created_at': const TimestampConverter().toJson(instance.createdAt),
      'updated_at': const TimestampConverter().toJson(instance.updatedAt),
      'last_login_at': const TimestampConverter().toJson(instance.lastLoginAt),
    };
