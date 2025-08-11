import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storage_repository/storage_repository.dart';

part 'video.freezed.dart';
part 'video.g.dart';

/// {@template video}
/// Video model representing a video in the system
/// {@endtemplate}
@freezed
abstract class VideoModel with _$VideoModel {
  /// {@macro video}
  @JsonSerializable(explicitToJson: true)
  const factory VideoModel({
    /// Unique identifier for the video
    @JsonKey(name: 'video_id') required String videoId,

    /// Title of the video
    required String title,

    /// URL of the video (Firebase Storage link)
    required String url,

    /// Branding information for the video
    String? branding,

    /// Description of the video
    String? description,

    /// Thumbnail URL for the video
    @JsonKey(name: 'thumbnail_url') String? thumbnailUrl,

    /// Duration of the video in seconds
    int? duration,

    /// When the video was created
    @JsonKey(name: 'created_at') @TimestampConverter() Timestamp? createdAt,

    /// When the video was last updated
    @JsonKey(name: 'updated_at') @TimestampConverter() Timestamp? updatedAt,
  }) = _VideoModel;

  /// Create a Video from JSON
  factory VideoModel.fromJson(Map<String, dynamic> json) =>
      _$VideoModelFromJson(json);

  static const empty = VideoModel(
    videoId: '',
    title: '',
    url: '',
    branding: null,
    description: null,
    thumbnailUrl: null,
    duration: null,
    createdAt: null,
    updatedAt: null,
  );
}

