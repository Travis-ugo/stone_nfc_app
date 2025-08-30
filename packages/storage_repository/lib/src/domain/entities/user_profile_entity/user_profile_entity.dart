import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_entity.freezed.dart';
part 'user_profile_entity.g.dart';

/// {@template user_profile_entity}
/// User Profile entity representing a user profile document in Firestore
/// {@endtemplate}
@freezed
abstract class UserProfileEntity with _$UserProfileEntity {
  const factory UserProfileEntity({
    /// Unique identifier for the user
    required String userId,

    /// Display name of the user
    String? displayName,

    /// Email address of the user
    String? email,

    /// Profile photo URL
    String? photoUrl,

    /// Phone number of the user
    String? phoneNumber,

    /// Date of birth
    @TimestampDateTimeConverter() DateTime? dateOfBirth,

    /// Gender of the user
    String? gender,

    /// When the profile was created
    @TimestampDateTimeConverter() DateTime? createdAt,

    /// When the profile was last updated
    @TimestampDateTimeConverter() DateTime? updatedAt,

    /// When the user last logged in
    @TimestampDateTimeConverter() DateTime? lastLoginAt,
  }) = _UserProfileEntity;

  factory UserProfileEntity.fromJson(Map<String, dynamic> json) =>
      _$UserProfileEntityFromJson(json);

      static const empty = UserProfileEntity(
        userId: '',
        displayName: '',
        email: '',
        photoUrl: '',
        phoneNumber: '',
        dateOfBirth: null,
        gender: '',
        lastLoginAt: null,
      );
}

/// Converts Firestore [Timestamp] <-> [DateTime]
class TimestampDateTimeConverter implements JsonConverter<DateTime?, Object?> {
  const TimestampDateTimeConverter();

  @override
  DateTime? fromJson(Object? json) {
    if (json is Timestamp) return json.toDate();
    return null;
  }

  @override
  Object? toJson(DateTime? date) =>
      date != null ? Timestamp.fromDate(date) : null;
}
