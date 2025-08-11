import 'dart:io';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:storage_repository/storage_repository.dart';

abstract class StorageDatasource {
  Future<UserProfileModel?> getUserProfile({required String userId});
  Future<UserProfileModel> saveUserProfile({required UserProfileModel profile});
  Future<void> updateUserProfile({required UserProfileModel profile});
  Future<void> deleteUserProfile({required String userId});

  /// Returns the generated NFC token
  Future<String> uploadVideoWithToken({
    required String videoFilePath,
    required String thumbnailFilePath,
    required String title,
    String? branding,
    String? description,
    int? duration,
  });

  Future<VideoModel?> getVideoByToken({required String nfcToken});

  Future<List<WatchHistoryModel>> getUserWatchHistory({required String userId});
  Future<WatchHistoryModel> addWatchHistory({
    required WatchHistoryModel history,
  });
  Future<void> updateWatchHistory({required WatchHistoryModel history});
}

class StorageDataSourceImpl implements StorageDatasource {
  StorageDataSourceImpl({
    required FirebaseFirestore firestore,
    required FirebaseAuth auth,
    required FirebaseStorage storage,
  })  : _firestore = firestore,
        _auth = auth,
        _storage = storage;

  final FirebaseFirestore _firestore;
  final FirebaseAuth _auth;
  final FirebaseStorage _storage;

  CollectionReference<Map<String, dynamic>> get _nfcTokensCollection =>
      _firestore.collection('NFC');
  CollectionReference<Map<String, dynamic>> get _watchHistoryCollection =>
      _firestore.collection('Watch History');
  CollectionReference<Map<String, dynamic>> get _userProfilesCollection =>
      _firestore.collection('Profiles');

  // ----------------- User Profiles -----------------
  @override
  Future<UserProfileModel?> getUserProfile({required String userId}) async {
    try {
      final doc = await _userProfilesCollection.doc(userId).get();
      if (!doc.exists) return null;
      return UserProfileModel.fromFirestore(doc);
    } catch (e) {
      throw Exception('Failed to get user profile: $e');
    }
  }

  @override
  Future<UserProfileModel> saveUserProfile({
    required UserProfileModel profile,
  }) async {
    try {
      await _userProfilesCollection.doc(profile.userId).set(profile.toJson());
      return profile;
    } catch (e) {
      throw Exception('Failed to save user profile: $e');
    }
  }

  @override
  Future<void> updateUserProfile({required UserProfileModel profile}) async {
    try {
      await _userProfilesCollection
          .doc(profile.userId)
          .update(profile.toJson());
    } catch (e) {
      throw Exception('Failed to update user profile: $e');
    }
  }

  @override
  Future<void> deleteUserProfile({required String userId}) async {
    try {
      await _userProfilesCollection.doc(userId).delete();
    } catch (e) {
      throw Exception('Failed to delete user profile: $e');
    }
  }

  // ----------------- Upload Video with NFC Token -----------------
  @override
  Future<String> uploadVideoWithToken({
    required String videoFilePath,
    required String thumbnailFilePath,
    required String title,
    String? branding,
    String? description,
    int? duration,
    bool isImage = false,
    void Function(double progress)? onProgress,
  }) async {
    print('ATTEMPTING TO UPLOAD');
    try {
      // Step 1: Upload media (video or image)
      final millis = DateTime.now().millisecondsSinceEpoch;
      final String mediaPath;
      final String mediaUrl;
      if (isImage) {
        final ext = _extensionForPath(videoFilePath);
        // Guard: do not force .mp4 for images; require valid image extension
        final safeExt = _isImageExt(ext) ? ext : '.jpg';
        final imageFileName = 'image_$millis$safeExt';
        mediaPath = 'images/$imageFileName';
        mediaUrl = await _uploadFile(videoFilePath, mediaPath, onProgress: onProgress);
      } else {
        // Always use .mp4 for video uploads
        final videoFileName = 'video_$millis.mp4';
        mediaPath = 'videos/$videoFileName';
        mediaUrl = await _uploadFile(videoFilePath, mediaPath, onProgress: onProgress);
      }

      // Step 2: Upload thumbnail
      final String thumbFileName = 'thumb_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final String thumbnailUrl = await _uploadFile(thumbnailFilePath, 'thumbnails/$thumbFileName');

      // Step 3: Generate NFC token
      final String token = _generateNfcToken();

      // Step 4: Create a new doc in NFC collection
      final docRef = _nfcTokensCollection.doc(); // auto-generated ID
      final videoId = docRef.id;

      final video = VideoModel(
        videoId: videoId,
        title: title,
        url: mediaUrl,
        branding: branding,
        description: description,
        thumbnailUrl: thumbnailUrl,
        duration: duration,
      );

      // Step 5: Save video + NFC token in the same doc
      await docRef.set({
        ...video.toJson(),
        'nfc_tag': token,
        'created_at': DateTime.now(),
      });

      print('UPLOAD COMPLETE: videoId=$videoId token=$token');
      return token;
    } catch (e) {
      throw Exception('Failed to upload video with token: $e');
    }
  }

  // ----------------- Get Video by NFC Token -----------------
  @override
  Future<VideoModel?> getVideoByToken({required String nfcToken}) async {
    try {
      final query = await _nfcTokensCollection
          .where('nfc_tag', isEqualTo: nfcToken)
          .orderBy('created_at', descending: true)
          .limit(1)
          .get();

      if (query.docs.isEmpty) return null;

      final docData = query.docs.first.data();
      return VideoModel.fromJson(docData);
    } catch (e) {
      throw Exception('Failed to get video by NFC token: $e');
    }
  }

  // ----------------- Watch History -----------------
  @override
  Future<List<WatchHistoryModel>> getUserWatchHistory({
    required String userId,
  }) async {
    try {
      final querySnapshot = await _watchHistoryCollection
          .where('user_id', isEqualTo: userId)
          .orderBy('viewed_at', descending: true)
          .get();
      return querySnapshot.docs
          .map((doc) => WatchHistoryModel.fromFirestore(doc))
          .toList();
    } catch (e) {

      print("PRINT ERROR NOW: ::::: $e");
      throw Exception('Failed to get watch history: $e');
    }
  }

  @override
  Future<WatchHistoryModel> addWatchHistory({
    required WatchHistoryModel history,
  }) async {
    try {
      final docRef = await _watchHistoryCollection.add(history.toJson());
      return history.copyWith(id: docRef.id);
    } catch (e) {
      throw Exception('Failed to add watch history: $e');
    }
  }

  @override
  Future<void> updateWatchHistory({required WatchHistoryModel history}) async {
    try {
      if (history.id == null) {
        throw Exception('Watch history ID is required for update');
      }
      await _watchHistoryCollection.doc(history.id).update(history.toJson());
    } catch (e) {
      throw Exception('Failed to update watch history: $e');
    }
  }

  // ----------------- Helpers -----------------
  Future<String> _uploadFile(
    String filePath,
    String storagePath, {
    void Function(double progress)? onProgress,
  }) async {
    print('UPLOAD TRYING: $filePath');
    final file = File(filePath);
    if (!file.existsSync()) {
      throw Exception("File does not exist at path: $filePath");
    }
    final ref = _storage.ref().child(storagePath);
    final contentType = _inferContentType(filePath);
    try {
      // Primary path: upload from file
      final uploadTask = ref.putFile(
        file,
        SettableMetadata(contentType: contentType),
      );
      uploadTask.snapshotEvents.listen((TaskSnapshot s) {
        if (s.totalBytes > 0 && onProgress != null) {
          onProgress(s.bytesTransferred / s.totalBytes);
        }
      });
      await uploadTask;
      print('UPLOAD COMPLETE for $storagePath');

      // Retry getDownloadURL to mitigate transient iOS errors
      int attempts = 0;
      while (true) {
        try {
          return await ref.getDownloadURL();
        } catch (e) {
          attempts++;
          if (attempts >= 5) rethrow;
          await Future.delayed(Duration(milliseconds: 500 * attempts));
        }
      }
    } catch (e) {
      // Fallback: upload using bytes buffer (addresses iOS 'Message too long')
      print('UPLOAD FAILED: $e');
      try {
        final bytes = await file.readAsBytes();
        final uploadTask = ref.putData(
          bytes,
          SettableMetadata(contentType: contentType),
        );
        uploadTask.snapshotEvents.listen((TaskSnapshot s) {
          if (s.totalBytes > 0 && onProgress != null) {
            onProgress(s.bytesTransferred / s.totalBytes);
          }
        });
        await uploadTask;
        print('UPLOAD (putData) COMPLETE for $storagePath');
        int attempts = 0;
        while (true) {
          try {
            return await ref.getDownloadURL();
          } catch (e) {
            attempts++;
            if (attempts >= 5) rethrow;
            await Future.delayed(Duration(milliseconds: 500 * attempts));
          }
        }
      } catch (e2) {
        print('UPLOAD via putData FAILED: $e2');
        rethrow;
      }
    }
  }

  String _inferContentType(String path) {
    final lower = path.toLowerCase();
    if (lower.endsWith('.mp4')) return 'video/mp4';
    if (lower.endsWith('.mov')) return 'video/quicktime';
    if (lower.endsWith('.m4v')) return 'video/x-m4v';
    if (lower.endsWith('.avi')) return 'video/x-msvideo';
    if (lower.endsWith('.jpg') || lower.endsWith('.jpeg')) return 'image/jpeg';
    if (lower.endsWith('.png')) return 'image/png';
    if (lower.endsWith('.gif')) return 'image/gif';
    return 'application/octet-stream';
  }

  String _extensionForPath(String path) {
    final lower = path.toLowerCase();
    final dot = lower.lastIndexOf('.');
    if (dot == -1) return '';
    return lower.substring(dot);
  }

  bool _isImageExt(String ext) {
    switch (ext) {
      case '.jpg':
      case '.jpeg':
      case '.png':
      case '.gif':
      case '.webp':
        return true;
      default:
        return false;
    }
  }

  String _generateNfcToken({int length = 10}) {
    const chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final random = Random.secure();
    return List.generate(
      length,
      (_) => chars[random.nextInt(chars.length)],
    ).join();
  }
}
