import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storage_repository/storage_repository.dart';

part 'video_entity.freezed.dart';
part 'video_entity.g.dart';

/// {@template video_entity}
/// Video entity representing a video document in Firestore.
/// {@endtemplate}
@freezed
abstract class VideoEntity with _$VideoEntity {
  /// {@macro video_entity}
  const factory VideoEntity({
    /// Unique identifier for the video.
    required String videoId,

    /// Title of the video.
    required String title,

    /// URL of the video (Firebase Storage link).
    required String url,

    /// Branding information for the video.
    String? branding,

    /// Description of the video.
    String? description,

    /// Thumbnail URL for the video.
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,

    /// Duration of the video in seconds.
    int? duration,

    /// When the video was created.
    @TimestampDateTimeConverter() DateTime? createdAt,

    /// When the video was last updated.
   @TimestampDateTimeConverter() DateTime? updatedAt,
  }) = _VideoEntity;

  /// Create a VideoEntity from Firestore document.
  factory VideoEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw StateError('Missing data for videoId: ${doc.id}');
    }
    return VideoEntity.fromJson({
      'videoId': doc.id,
      ...data,
    });
  }

  /// Create a VideoEntity from JSON.
  factory VideoEntity.fromJson(Map<String, dynamic> json) =>
      _$VideoEntityFromJson(json);
}
