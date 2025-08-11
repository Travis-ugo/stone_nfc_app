import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile.freezed.dart';
part 'user_profile.g.dart';

/// {@template user_profile}
/// User Profile model representing extended user data stored in Firestore
/// {@endtemplate}

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  const factory UserProfileModel({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'display_name') String? displayName,
    String? email,
    @JsonKey(name: 'photo_url') String? photoUrl,
    @JsonKey(name: 'phone_number') String? phoneNumber,

    @JsonKey(name: 'date_of_birth')
    @TimestampConverter()
    Timestamp? dateOfBirth,

    String? gender,
    Map<String, dynamic>? preferences,

    @JsonKey(name: 'created_at') @TimestampConverter() Timestamp? createdAt,

    @JsonKey(name: 'updated_at') @TimestampConverter() Timestamp? updatedAt,

    @JsonKey(name: 'last_login_at')
    @TimestampConverter()
    Timestamp? lastLoginAt,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);


  // factory UserProfileEntity.fromFirestore(
  //   DocumentSnapshot<Map<String, dynamic>> doc,
  // ) {
  //   final data = doc.data();
  //   if (data == null) {
  //     throw StateError('Missing data for userId: ${doc.id}');
  //   }
  //   return UserProfileEntity.fromJson({
  //     'userId': doc.id,
  //     ...data,
  //   });
  // }

  factory UserProfileModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw StateError('Missing data for videoId: ${doc.id}');
    }
    return UserProfileModel.fromJson(data);
  }
}

class TimestampConverter implements JsonConverter<Timestamp?, Object?> {
  const TimestampConverter();

  @override
  Timestamp? fromJson(Object? json) {
    if (json is Timestamp) return json;
    return null;
  }

  @override
  Object? toJson(Timestamp? timestamp) => timestamp;
}
