import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storage_repository/storage_repository.dart';

part 'nfc_token.freezed.dart';
part 'nfc_token.g.dart';

/// {@template nfc_token}
/// NFC Token model representing an NFC tag that links to a video
/// {@endtemplate}
@freezed
abstract class NFCTokenModel with _$NFCTokenModel {
  /// {@macro nfc_token}
  const factory NFCTokenModel({
    /// Unique identifier for the NFC tag
    @JsonKey(name: 'tag_id') required String tagId,

    /// ID of the video this tag links to
    @JsonKey(name: 'video_id') required String videoId,

    /// When the token expires
    @JsonKey(name: 'expires_at') @TimestampConverter() Timestamp? expiresAt,

    /// Whether the token is currently active
    @JsonKey(name: 'is_active') @Default(true) bool isActive,

    /// When the token was created
    @JsonKey(name: 'created_at') @TimestampConverter() Timestamp? createdAt,

    /// When the token was last updated
    @JsonKey(name: 'updated_at') @TimestampConverter() Timestamp? updatedAt,
  }) = _NFCTokenModel;

  /// Create a NFCToken from JSON
  factory NFCTokenModel.fromJson(Map<String, dynamic> json) =>
      _$NFCTokenModelFromJson(json);
}

/// Extension methods for NFCToken
extension NFCTokenExtension on NFCTokenModel {
  /// Check if the token is expired
  bool get isExpired =>
      expiresAt != null && DateTime.now().isAfter(expiresAt!.toDate());

  /// Check if the token is valid (not expired and active)
  bool get isValid => !isExpired && isActive;
}