import 'package:tag_play/features/watched_history/bloc/watched_history_bloc.dart';
import 'package:tag_play/features/watched_history/widgets/watch_history_card.dart';
import '../../../core/core.dart';
import 'package:tag_play/presentation/app/bloc/app_bloc.dart';

class WatchedHistoryPage extends StatelessWidget {
  const WatchedHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          color: Theme.of(context).colorScheme.onBackground,
          height: 70,
        ),
        backgroundColor: WhiteColors.white_100,
        elevation: 0,
      ),
      body: RefreshIndicator.adaptive(
        color: Theme.of(context).colorScheme.primary,
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

class WatchedHistoryView extends StatelessWidget {
  const WatchedHistoryView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Watched History',
            style: TextStyle(
              fontSize: FontSize.lg,
              fontWeight: FontWeight.bold,
              color: WhiteColors.white_100,
            ),
          ),
          const VSpaceWidget(height: 16),
          Expanded(
            child: BlocBuilder<WatchedHistoryBloc, WatchedHistoryState>(
              builder: (context, state) {
                if (state.isLoading) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: GreyColors.grey_100,
                    ),
                  );
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
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.error,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                if (state.isSuccess) {
                  final watchHistory = state.watchHistory;

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
                            style: TextStyle(color: GreyColors.grey_200),
                          ),
                          const VSpaceWidget(height: 8),
                          Text(
                            'Videos you watch will appear here',
                            style: TextStyle(color: GreyColors.grey_200),
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
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
