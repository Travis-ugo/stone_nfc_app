import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:storage_repository/storage_repository.dart';
import 'package:tag_play/core/core.dart';
import 'package:tag_play/features/profile/profile_bloc.dart';
import 'package:tag_play/features/watched_history/bloc/watched_history_bloc.dart';
import 'package:tag_play/presentation/app/bloc/app_bloc.dart';
import 'package:tag_play/features/home/bloc/home_bloc.dart';
import 'package:tag_play/presentation/navigation/routes.dart';
import 'package:tag_play/core/services/nfc_service.dart';

class AuthenticatedRoute extends StatelessWidget {
  const AuthenticatedRoute({super.key});

  static Page<void> page() =>
      const MaterialPage<void>(child: AuthenticatedRoute());

  @override
  Widget build(BuildContext context) {
    final user = context.select((AppBloc bloc) => bloc.state.user);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => HomeBloc(
            storageRepository: context.read<StorageRepositoryImpl>(),
          ),
        ),
        BlocProvider(
          create: (context) => WatchedHistoryBloc(
            storageRepository: context.read<StorageRepositoryImpl>(),
          )..add(WatchHistoryRequested(userId: user.id)),
        ),
        BlocProvider(
          create: (context) => ProfileBloc(
            storageRepository: context.read<StorageRepositoryImpl>(),
          )..add(ProfileRequested(user.id)),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: AppRouter.router,
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  /// {@macro home_page}
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}

class HomeView extends StatefulWidget {
  /// {@macro home_view}
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  Future<void> _scanNfcAndFetch() async {
    final nfcService = NfcService();
    try {
      final scanned = await nfcService.scanNfcTag();
      if (scanned == null || scanned.trim().isEmpty) {
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(const SnackBar(content: Text('No NFC tag detected')));
        }
        return;
      }

      if (mounted) {
        context.read<HomeBloc>().add(
          HomeVideosRequested(nfcToken: scanned.trim()),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('NFC scan failed: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (prev, curr) => prev.status != curr.status,
          listener: (context, state) {
            if (state.status == HomeStatus.success && state.video != null) {
              context.read<WatchedHistoryBloc>().add(
                VideoPlayed(
                  userId: context.read<AppBloc>().state.user.id,
                  video: state.video!,
                ),
              );
              context.push(
                '/video/${state.video!.videoId}?url=${Uri.encodeComponent(state.video!.url)}&title=${Uri.encodeComponent(state.video!.title)}&thumbnailUrl=${Uri.encodeComponent(state.video!.thumbnailUrl!)}',
              );
            } else if (state.status == HomeStatus.failure &&
                state.errorMessage != null) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.errorMessage!)));
            }
          },
        ),
        BlocListener<HomeBloc, HomeState>(
          listenWhen: (prev, curr) => prev.uploadStatus != curr.uploadStatus,
          listener: (context, state) {
            if (state.uploadStatus == UploadStatus.success &&
                (state.lastGeneratedNfcToken ?? '').isNotEmpty) {
              final token = Uri.encodeComponent(state.lastGeneratedNfcToken!);
              context.push('/nfc/$token');
            }
          },
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Image.asset(
            'assets/images/logo.png',
            color: BlackColors.black_500,
            height: 70,
          ),

          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(8.0),
            child: SizedBox(),
          ),
          elevation: 0,
          actions: <Widget>[
            BlocBuilder<HomeBloc, HomeState>(
              buildWhen: (p, c) =>
                  p.uploadStatus != c.uploadStatus ||
                  p.uploadProgress != c.uploadProgress,
              builder: (context, state) {
                if (state.uploadStatus == UploadStatus.loading) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(
                            value: state.uploadProgress.clamp(0.0, 1.0),
                            strokeWidth: 2,
                            color: PrimaryColor.primary_400,
                            backgroundColor: PrimaryColor.primary_100,
                          ),
                        ),
                        Text(
                          '${(state.uploadProgress * 100).toStringAsFixed(0)}%',
                          style: TextStyle(
                            fontSize: FontSize.tiny - 2,
                            fontWeight: FontWeightMade.medium,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return const SizedBox.shrink();
              },
            ),
            IconButton(
              key: const Key('homePage_scan_iconButton'),
              icon: SvgPicture.asset('assets/icons/scan.svg', height: 28.h),
              onPressed: () => _pickMediaFile(context),
            ),
          ],
        ),
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/home_background.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 2),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset('assets/images/logo.png', height: 190.h),
                // Card(
                //   child: Padding(
                //     padding: const EdgeInsets.all(16.0),
                //     child: Row(
                //       children: [
                //         Avatar(photo: user.photo),
                //         const SizedBox(width: 16),
                //         Expanded(
                //           child: Column(
                //             crossAxisAlignment: CrossAxisAlignment.start,
                //             children: [
                //               Text(
                //                 'Welcome back!',
                //                 style: textTheme.titleLarge,
                //               ),
                //               const SizedBox(height: 4),
                //               Text(
                //                 user.name ?? user.email ?? 'User',
                //                 style: textTheme.bodyLarge?.copyWith(
                //                   color: Colors.grey[600],
                //                 ),
                //               ),
                //             ],
                //           ),
                //         ),
                //       ],
                //     ),
                //   ),
                // ),

                // const SizedBox(height: 24),

                // Quick actions header
                // Text(
                //   'Quick Actions',
                //   style: textTheme.titleLarge?.copyWith(
                //     fontWeight: FontWeight.bold,
                //   ),
                // ),
                // const SizedBox(height: 16),

                // Quick actions cards
                // Row(
                //   children: [
                //     Expanded(
                //       child: _buildActionCard(
                //         context,
                //         icon: Icons.qr_code_scanner,
                //         title: 'Scan NFC',
                //         subtitle: 'Scan a tag to play video',

                //         onTap: () => _scanNfcAndFetch(),
                //       ),
                //     ),
                //     const SizedBox(width: 16),
                Expanded(
                  child: _buildActionCard(
                    context,
                    iconPath: 'assets/icons/scan.svg',
                    title: 'Enter Token',
                    subtitle: 'Enter NFC token manually',
                    onTap: () => context.push('/enter-token'),
                  ),
                ),
                //   ],
                // ),
                Center(
                  child: _buildActionCard(
                    context,
                    iconPath: 'assets/icons/scan.svg',
                    title: 'Scan NFC',
                    subtitle: 'Scan a tag to\nplay video',
                    onTap: () => _scanNfcAndFetch(),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildActionCard(
    BuildContext context, {
    required String iconPath,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: BlackColors.black_500, width: 1),
      ),
      color: Color.fromARGB(255, 243, 232, 202),
      elevation: 4,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Column(
            children: [
              SvgPicture.asset(iconPath, height: 18),
              const SizedBox(height: 4),
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeightMade.bold,
                  color: BlackColors.black_500,
                  fontSize: FontSize.xs,
                ),
              ),
              const SizedBox(height: 3),
              Text(
                subtitle,
                style: TextStyle(
                  fontSize: FontSize.xs,
                  color: Colors.grey[600],
                  fontWeight: FontWeightMade.semiBold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Opens file picker for video/image and dispatches UploadMedia event
  Future<void> _pickMediaFile(BuildContext context) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['mp4', 'mov', 'avi', 'jpg', 'jpeg', 'png', 'gif'],
      );

      if (result != null && result.files.isNotEmpty) {
        final file = File(result.files.single.path!);
        context.read<HomeBloc>().add(UploadMedia(file: file));
      } else {
        // User cancelled the picker
      }
    } catch (e) {
      // Optionally handle errors here
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Failed to pick file: $e')));
    }
  }
}
