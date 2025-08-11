import 'package:dartz/dartz.dart';
import '../entities/video_entity/video_entity.dart';
import '../entities/watch_history_entity/watch_history_entity.dart';
import '../entities/user_profile_entity/user_profile_entity.dart';

abstract class StorageRepository {
  /// Get a user profile by ID
  Future<Either<String, UserProfileEntity?>> getUserProfile({
    required String userId,
  });

  /// Create or update a user profile
  Future<Either<String, UserProfileEntity>> saveUserProfile({
    required UserProfileEntity profile,
  });

  /// Update an existing user profile
  Future<Either<String, bool>> updateUserProfile({
    required UserProfileEntity profile,
  });

  /// Delete a user profile
  Future<Either<String, bool>> deleteUserProfile({
    required String userId,
  });

  /// Upload video and thumbnail, create Firestore entry, generate NFC token
  /// Returns the generated NFC token on success
  Future<Either<String, String>> uploadVideoWithToken({
    required String videoFilePath,
    required String thumbnailFilePath,
    required String title,
    String? branding,
    String? description,
    int? duration,
    bool isImage = false,
    void Function(double progress)? onProgress,
  });

  /// Fetch a video by NFC token
  Future<Either<String, VideoEntity?>> getVideoByToken({
    required String nfcToken,
  });

  /// Get a user's watch history
  Future<Either<String, List<WatchHistoryEntity>>> getUserWatchHistory({
    required String userId,
  });

  /// Add a watch history record
  Future<Either<String, WatchHistoryEntity>> addWatchHistory({
    required WatchHistoryEntity history,
  });

  /// Update a watch history record
  Future<Either<String, bool>> updateWatchHistory({
    required WatchHistoryEntity history,
  });
}
