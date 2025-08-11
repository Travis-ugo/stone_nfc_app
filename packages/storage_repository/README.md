# Storage Repository

A comprehensive repository for handling all data storage operations in the Tag Play app, including users, videos, NFC tokens, and watch history.

## Features

- **Video Management**: Create, read, update, and delete video records
- **NFC Token Management**: Handle NFC tag associations with videos
- **Watch History**: Track user video viewing history
- **User Profile Management**: Store and manage user profile data
- **Firebase Storage Integration**: Upload and manage video files
- **Freezed Models**: Type-safe, immutable data models with JSON serialization

## Data Models

### Video
Represents a video in the system with metadata.

```dart
Video(
  videoId: 'unique-id',
  title: 'Video Title',
  url: 'https://firebase-storage-url.com/video.mp4',
  branding: 'Brand Name',
  description: 'Video description',
  thumbnailUrl: 'https://thumbnail-url.com',
  duration: 120, // seconds
)
```

### NFCToken
Represents an NFC tag that links to a video.

```dart
NFCToken(
  tagId: 'nfc-tag-uid',
  videoId: 'video-id',
  expiresAt: DateTime.now().add(Duration(days: 30)),
  isActive: true,
)
```

### WatchHistory
Tracks user video viewing records.

```dart
WatchHistory(
  userId: 'user-id',
  videoId: 'video-id',
  viewedAt: DateTime.now(),
  watchDuration: 60, // seconds watched
  completed: false,
)
```

### UserProfile
Extended user data stored in Firestore.

```dart
UserProfile(
  userId: 'user-id',
  displayName: 'John Doe',
  email: 'john@example.com',
  photoUrl: 'https://photo-url.com',
  phoneNumber: '+1234567890',
  dateOfBirth: DateTime(1990, 1, 1),
  gender: 'male',
  preferences: {'theme': 'dark'},
)
```

## Usage

### Initialize the Repository

```dart
import 'package:storage_repository/storage_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final storageRepository = StorageRepository(
  firestore: FirebaseFirestore.instance,
  auth: FirebaseAuth.instance,
  storage: FirebaseStorage.instance,
);
```

### Video Operations

```dart
// Get a video by ID
final video = await storageRepository.getVideo('video-id');

// Get all videos
final videos = await storageRepository.getAllVideos();

// Create a new video
final newVideo = Video(
  videoId: 'new-id',
  title: 'New Video',
  url: 'https://example.com/video.mp4',
);
final createdVideo = await storageRepository.createVideo(newVideo);

// Update a video
final updatedVideo = video.copyWith(title: 'Updated Title');
await storageRepository.updateVideo(updatedVideo);

// Delete a video
await storageRepository.deleteVideo('video-id');
```

### NFC Token Operations

```dart
// Get NFC token by tag ID
final token = await storageRepository.getNfcToken('tag-uid');

// Create a new NFC token
final newToken = NFCToken(
  tagId: 'tag-uid',
  videoId: 'video-id',
  expiresAt: DateTime.now().add(Duration(days: 30)),
);
await storageRepository.createNfcToken(newToken);

// Check if token is valid
if (token.isValid) {
  // Token is not expired and active
}
```

### Watch History Operations

```dart
// Get user's watch history
final history = await storageRepository.getUserWatchHistory('user-id');

// Add a watch history record
final watchRecord = WatchHistory(
  userId: 'user-id',
  videoId: 'video-id',
  viewedAt: DateTime.now(),
  completed: true,
);
await storageRepository.addWatchHistory(watchRecord);
```

### User Profile Operations

```dart
// Get user profile
final profile = await storageRepository.getUserProfile('user-id');

// Save or update user profile
final userProfile = UserProfile(
  userId: 'user-id',
  displayName: 'John Doe',
  email: 'john@example.com',
);
await storageRepository.saveUserProfile(userProfile);
```

### File Upload Operations

```dart
// Upload video file
final downloadUrl = await storageRepository.uploadVideo(
  '/path/to/video.mp4',
  'video.mp4',
);

// Delete video file
await storageRepository.deleteVideoFile(downloadUrl);
```

## Firestore Collections

The repository uses the following Firestore collections:

- `videos` - Video metadata and information
- `nfc_tokens` - NFC tag associations with videos
- `watch_history` - User video viewing records
- `user_profiles` - Extended user profile data

## Dependencies

- `freezed_annotation` - For immutable data classes
- `json_annotation` - For JSON serialization
- `cloud_firestore` - For Firestore database operations
- `firebase_auth` - For authentication
- `firebase_storage` - For file storage operations
- `equatable` - For value equality

## Development

### Generate Freezed Files

```bash
flutter packages pub run build_runner build
```

### Run Tests

```bash
flutter test
```

## Architecture

The repository follows a clean architecture pattern with:

1. **Models** - Freezed data classes representing business entities
2. **Entities** - Firestore document representations
3. **Mappers** - Convert between models and entities
4. **Repository** - Main class handling all data operations

This separation ensures type safety, testability, and maintainability of the codebase.


