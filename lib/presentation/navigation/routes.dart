import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tag_play/core/core.dart';
import 'package:tag_play/features/profile/view/edit_profile_page.dart';
import 'view/main_navigation_page.dart';
import '../../features/home/home.dart';
import '../../features/home/view/nfc_write_page.dart';
import '../../features/home/view/token_manual_page.dart';
import '../../features/watched_history/watched_history.dart';
import '../../features/profile/profile.dart';
import '../../features/video_player/video_player.dart';

/// {@template app_router}
/// App router configuration using Go Router
/// {@endtemplate}
class AppRouter {
  /// {@macro app_router}
  const AppRouter._();

  /// The GoRouter instance for the app
  static final GoRouter router = GoRouter(
    initialLocation: '/home',
    routes: [
      // Video player route (outside ShellRoute - no bottom navigation)
      GoRoute(
        path: '/video/:videoId',
        name: 'video',
        builder: (context, state) {
          final videoId = state.pathParameters['videoId']!;
          final videoUrl = state.uri.queryParameters['url'] ?? '';
          final videoTitle = state.uri.queryParameters['title'] ?? '';
          final thumbnailUrl = state.uri.queryParameters['thumbnailUrl'] ?? '';

          return VideoPlayerPage(
            videoId: videoId,
            videoUrl: videoUrl,
            thumbnailUrl: thumbnailUrl,
            videoTitle: videoTitle.isNotEmpty ? videoTitle : null,
          );
        },
      ),

      // NFC write route (outside ShellRoute)
      GoRoute(
        path: '/nfc/:token',
        name: 'nfc_write',
        pageBuilder: (context, state) {
          final token = state.pathParameters['token']!;
          return MaterialPage(child: NfcWritePage(token: token));
        },
      ),
      // Manual token entry route
      GoRoute(
        path: '/enter-token',
        name: 'enter_token',
        pageBuilder: (context, state) {
          return MaterialPage(child: const TokenManualPage());
        },
      ),

      GoRoute(
        path: '/edit_profile',
        name: 'edit_profile',
        pageBuilder: (context, state) {
          final params = state.extra as Map<String, dynamic>?;
          return MaterialPage(
            child: EditProfilePage(
              userId: params?['userId'] as String?,
              currentName: params?['currentName'] as String?,
              currentPhotoUrl: params?['currentPhotoUrl'] as String?,
              currentEmail: params?['currentEmail'] as String?,
            ),
          );
        },
      ),

      // Main navigation with bottom bar
      ShellRoute(
        builder: (context, state, child) {
          return MainNavigationPage(location: state.uri.path, child: child);
        },
        routes: [
          GoRoute(
            path: '/home',
            name: 'home',
            pageBuilder: (context, state) {
              return MaterialPage(child: const HomePage());
            },
          ),
          GoRoute(
            path: '/history',
            name: 'history',
            pageBuilder: (context, state) {
              return MaterialPage(child: const WatchedHistoryPage());
            },
          ),
          GoRoute(
            path: '/profile',
            name: 'profile',
            pageBuilder: (context, state) {
              return MaterialPage(child: const ProfilePage());
            },
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => const ErrorPage(),
  );
}

/// {@template error_page}
/// Page displayed when a route is not found
/// {@endtemplate}
class ErrorPage extends StatelessWidget {
  /// {@macro error_page}
  const ErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page Not Found')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.error_outline, size: 64, color: Colors.grey),
            const SizedBox(height: 16),
            const Text(
              'Page Not Found',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            Text(
              'The page you are looking for does not exist.',
              style: TextStyle(fontSize: 16, color: Colors.grey[600]),
            ),
            const SizedBox(height: 24),
            PrimaryButton(
              onTap: () => context.go('/home'),
              buttonTitle: 'Go Home',
            ),
          ],
        ),
      ),
    );
  }
}
