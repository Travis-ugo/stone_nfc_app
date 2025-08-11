import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/user_profile/user_profile.dart';
import '../entities/user_profile_entity/user_profile_entity.dart';
extension UserProfileModelMapper on UserProfileModel {
  UserProfileEntity toEntity() {
    return UserProfileEntity(
      userId: userId,
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth?.toDate(),
      gender: gender,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
      lastLoginAt: lastLoginAt?.toDate(),
    );
  }
}

extension UserProfileEntityMapper on UserProfileEntity {
  UserProfileModel toModel() {
    return UserProfileModel(
      userId: userId,
      displayName: displayName,
      email: email,
      photoUrl: photoUrl,
      phoneNumber: phoneNumber,
      dateOfBirth: dateOfBirth != null
          ? Timestamp.fromDate(dateOfBirth!)
          : null,
      gender: gender,
      createdAt: createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : null,
      updatedAt: updatedAt != null
          ? Timestamp.fromDate(updatedAt!)
          : null,
      lastLoginAt: lastLoginAt != null
          ? Timestamp.fromDate(lastLoginAt!)
          : null,
    );
  }
}

extension UserProfileModelListMapper on List<UserProfileModel> {
  List<UserProfileEntity> toEntityList() =>
      map((model) => model.toEntity()).toList();
}

extension UserProfileEntityListMapper on List<UserProfileEntity> {
  List<UserProfileModel> toModelList() =>
      map((entity) => entity.toModel()).toList();
}
