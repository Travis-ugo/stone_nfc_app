import 'package:tag_play/features/home/bloc/home_bloc.dart';
import 'package:tag_play/features/watched_history/bloc/watched_history_bloc.dart';
import 'package:tag_play/features/watched_history/widgets/watch_history_card.dart';
import 'package:tag_play/presentation/app/bloc/app_bloc.dart';
import '../../../core/core.dart';

/// {@template watched_history_page}
/// Page that displays the user's video watch history
/// {@endtemplate}
class WatchedHistoryPage extends StatelessWidget {
  /// {@macro watched_history_page}
  const WatchedHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Watch History'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: RefreshIndicator.adaptive(
        color: BlackColors.black_600,
        onRefresh: () async {
          context.read<WatchedHistoryBloc>().add(
            WatchHistoryRequested(userId: user.id),
          );
        },
        child: const WatchedHistoryView(),
      ),
    );
  }
}

/// {@template watched_history_view}
/// View that displays the watch history content
/// {@endtemplate}
class WatchedHistoryView extends StatelessWidget {
  /// {@macro watched_history_view}
  const WatchedHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Recently Watched',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const VSpaceWidget(height: 16),
          Expanded(
            child: BlocBuilder<WatchedHistoryBloc, WatchedHistoryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state.isFailure) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.error_outline,
                          size: 64,
                          color: Colors.grey,
                        ),
                        const VSpaceWidget(height: 16),
                        Text(
                          'Failed to load watch history',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                      ],
                    ),
                  );
                }
                if (state.isSuccess) {
                  final watchHistory = state.watchHistory ?? [];

                  if (watchHistory.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.history,
                            size: 64,
                            color: Colors.grey,
                          ),
                          const VSpaceWidget(height: 16),
                          Text(
                            'No watch history yet',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                          const VSpaceWidget(height: 8),
                          Text(
                            'Videos you watch will appear here',
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                    );
                  }

                  return ListView.builder(
                    itemCount: watchHistory.length,
                    itemBuilder: (context, index) {
                      final history = watchHistory[index];
                      return WatchHistoryCard(history: history);
                    },
                  );
                }

                // Fallback for initial state or unhandled states
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
