import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:storage_repository/storage_repository.dart';

void main() {
  group('StorageRepository', () {
    test('should create Video model', () {
      final video = VideoModel(
        videoId: 'test-id',
        title: 'Test Video',
        url: 'https://example.com/video.mp4',
        branding: 'Test Brand',
      );

      expect(video.videoId, equals('test-id'));
      expect(video.title, equals('Test Video'));
      expect(video.url, equals('https://example.com/video.mp4'));
      expect(video.branding, equals('Test Brand'));
    });

    test('should create NFCToken model', () {
      final token = NFCTokenModel(
        tagId: 'tag-123',
        videoId: 'video-456',
        expiresAt: Timestamp.fromDate(DateTime.now().add(const Duration(days: 30))) , 
      );

      expect(token.tagId, equals('tag-123'));
      expect(token.videoId, equals('video-456'));
      expect(token.isActive, isTrue);
    });

    test('should create WatchHistory model', () {
      final history = WatchHistoryModel(
        userId: 'user-123',
        video: VideoModel.empty,
        viewedAt:  Timestamp.fromDate(DateTime.now()) , 
        completed: true,
      );

      expect(history.userId, equals('user-123'));
      expect(history.video.videoId, equals('video-456'));
      expect(history.completed, isTrue);
    });

    test('should create UserProfile model', () {
      final profile = UserProfileModel(
        userId: 'user-123',
        displayName: 'John Doe',
        email: 'john@example.com',
      );

      expect(profile.userId, equals('user-123'));
      expect(profile.displayName, equals('John Doe'));
      expect(profile.email, equals('john@example.com'));
    });
  });
}
