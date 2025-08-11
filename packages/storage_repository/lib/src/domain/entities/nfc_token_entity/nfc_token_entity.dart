import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:storage_repository/storage_repository.dart';

part 'nfc_token_entity.freezed.dart';
part 'nfc_token_entity.g.dart';

/// {@template nfc_token_entity}
/// NFC Token entity representing an NFC token document in Firestore.
/// {@endtemplate}
@freezed
abstract class NFCTokenEntity with _$NFCTokenEntity {
  /// {@macro nfc_token_entity}
  const factory NFCTokenEntity({
    /// Unique identifier for the NFC tag (token)
    required String tagId,

    /// ID of the video this tag links to
    @JsonKey(name: 'video_id') required String videoId,

    /// When the token expires
    @TimestampDateTimeConverter() DateTime? expiresAt,

    /// Whether the token is currently active
    @JsonKey(name: 'is_active') @Default(true) bool isActive,

    /// When the token was created
    @TimestampDateTimeConverter() DateTime? createdAt,

    /// When the token was last updated
    @TimestampDateTimeConverter() DateTime? updatedAt,
  }) = _NFCTokenEntity;

  const NFCTokenEntity._();

  /// Check if the token is expired
  bool get isExpired {
    if (expiresAt == null) return false; // No expiry date = not expired
    return Timestamp.now().millisecondsSinceEpoch >
        expiresAt!.millisecondsSinceEpoch;
  }

  /// Check if the token is valid (not expired and active)
  bool get isValid => !isExpired && isActive;

  /// Create from Firestore document
  factory NFCTokenEntity.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> doc,
  ) {
    final data = doc.data();
    if (data == null) {
      throw StateError('Missing data for tagId: ${doc.id}');
    }
    return NFCTokenEntity.fromJson({'tagId': doc.id, ...data});
  }

  /// Create from JSON
  factory NFCTokenEntity.fromJson(Map<String, dynamic> json) =>
      _$NFCTokenEntityFromJson(json);

  /// Convert to Firestore map
  Map<String, dynamic> toFirestore() {
    return {
      'video_id': videoId,
      'expires_at': expiresAt,
      'is_active': isActive,
      'created_at': createdAt ?? FieldValue.serverTimestamp(),
      'updated_at': FieldValue.serverTimestamp(),
    };
  }
}
