import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/nfc_token/nfc_token.dart';
import '../entities/nfc_token_entity/nfc_token_entity.dart';

extension NFCTokenModelMapper on NFCTokenModel {
  NFCTokenEntity toEntity() {
    return NFCTokenEntity(
      tagId: tagId,
      videoId: videoId,
      expiresAt: expiresAt?.toDate(),
      isActive: isActive,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension NFCTokenEntityMapper on NFCTokenEntity {
  NFCTokenModel toModel() {
    return NFCTokenModel(
      tagId: tagId,
      videoId: videoId,
      expiresAt: expiresAt != null
          ? Timestamp.fromDate(expiresAt!)
          : null,
      isActive: isActive,
      createdAt: createdAt != null
          ? Timestamp.fromDate(createdAt!)
          : null,
      updatedAt: updatedAt != null
          ? Timestamp.fromDate(updatedAt!)
          : null,
    );
  }
}

extension NFCTokenModelListMapper on List<NFCTokenModel> {
  List<NFCTokenEntity> toEntityList() =>
      map((model) => model.toEntity()).toList();
}

extension NFCTokenEntityListMapper on List<NFCTokenEntity> {
  List<NFCTokenModel> toModelList() =>
      map((entity) => entity.toModel()).toList();
}
