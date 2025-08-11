import 'package:cloud_firestore/cloud_firestore.dart';
import '../../data/models/video/video.dart';
import '../entities/video_entity/video_entity.dart';

extension VideoModelMapper on VideoModel {
  VideoEntity toEntity() {
    return VideoEntity(
      videoId: videoId,
      title: title,
      url: url,
      branding: branding,
      description: description,
      thumbnailUrl: thumbnailUrl,
      duration: duration,
      createdAt: createdAt?.toDate(),
      updatedAt: updatedAt?.toDate(),
    );
  }
}

extension VideoEntityMapper on VideoEntity {
  VideoModel toModel() {
    return VideoModel(
      videoId: videoId,
      title: title,
      url: url,
      branding: branding,
      description: description,
      thumbnailUrl: thumbnailUrl,
      duration: duration,
      createdAt: createdAt != null ? Timestamp.fromDate(createdAt!) : null,
      updatedAt: updatedAt != null ? Timestamp.fromDate(updatedAt!) : null,
    );
  }
}
