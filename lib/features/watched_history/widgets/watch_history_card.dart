import 'package:cached_network_image/cached_network_image.dart';
import 'package:storage_repository/storage_repository.dart';
import '../../../core/core.dart';

class WatchHistoryCard extends StatelessWidget {
  /// {@macro watch_history_card}
  const WatchHistoryCard({super.key, required this.history});

  /// The watch history item to display
  final WatchHistoryEntity history;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: ListTile(
        leading: Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(
            color: Colors.grey[300],
            borderRadius: BorderRadius.circular(8),
          ),
          child: history.video.thumbnailUrl == null
              ? Icon(
                  Icons.play_circle_outline,
                  color: Colors.grey[600],
                  size: 30,
                )
              : ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: CachedNetworkImage(
                    imageUrl: history.video.thumbnailUrl!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,

                    placeholder: (context, url) => const Icon(
                      Icons.person_outline,
                      size: 48.0,
                      color: Colors.grey,
                    ),
                    errorWidget: (context, url, error) => const Icon(
                      Icons.error,
                      size: 48.0,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
        ),
        title: Text(
          'Video ${history.video.videoId}',
          style: const TextStyle(fontWeight: FontWeight.w600),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              _formatDate(history.viewedAt),
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            if (history.watchDuration != null)
              Text(
                'Watched ${_formatDuration(history.watchDuration!)}',
                style: TextStyle(color: Colors.grey[600], fontSize: 12),
              ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (history.completed)
              const Icon(Icons.check_circle, color: Colors.green, size: 20),
            const Icon(Icons.chevron_right, color: Colors.grey),
          ],
        ),
        onTap: () {
          context.push(
            '/video/${history.video.videoId}?url=${Uri.encodeComponent(history.video.url)}&title=${Uri.encodeComponent(history.video.title)}',
          );
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 0) {
      return '${difference.inDays} day${difference.inDays == 1 ? '' : 's'} ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hour${difference.inHours == 1 ? '' : 's'} ago';
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes} minute${difference.inMinutes == 1 ? '' : 's'} ago';
    } else {
      return 'Just now';
    }
  }

  String _formatDuration(int seconds) {
    final minutes = seconds ~/ 60;
    final remainingSeconds = seconds % 60;

    if (minutes > 0) {
      return '$minutes:${remainingSeconds.toString().padLeft(2, '0')}';
    } else {
      return '${remainingSeconds}s';
    }
  }
}
