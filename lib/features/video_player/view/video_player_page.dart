import 'package:cached_network_image/cached_network_image.dart';
import 'package:chewie/chewie.dart';
import 'package:video_player/video_player.dart';
import '../../../core/core.dart';

class VideoPlayerPage extends StatefulWidget {
  const VideoPlayerPage({
    super.key,
    required this.videoId,
    required this.videoUrl,
    required this.thumbnailUrl, 
    this.videoTitle,
  });

  final String videoId;
  final String videoUrl;
  final String thumbnailUrl; 
  final String? videoTitle;

  @override
  State<VideoPlayerPage> createState() => _VideoPlayerPageState();
}

class _VideoPlayerPageState extends State<VideoPlayerPage> {
  VideoPlayerController? _controller;
  ChewieController? _chewieController;

  bool _isImage = false;
  bool _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();

    _isImage =
        _isImageUrl(widget.videoUrl) ||
        widget.videoUrl.toLowerCase().contains("images");

    if (_isImage) {
      _isLoading = false;
    } else {
      _initializePlayer();
    }

    SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);
  }

  bool _isImageUrl(String url) {
    final lower = url.toLowerCase();
    return lower.endsWith('.jpg') ||
        lower.endsWith('.jpeg') ||
        lower.endsWith('.png') ||
        lower.endsWith('.gif') ||
        lower.endsWith('.webp');
  }

  Future<void> _initializePlayer() async {
    try {
      _controller = VideoPlayerController.networkUrl(
        Uri.parse(widget.videoUrl),
      );

      await _controller!.initialize();

      _chewieController = ChewieController(
        videoPlayerController: _controller!,
        autoPlay: true,
        looping: true,
        zoomAndPan: true,
        autoInitialize: true,
        placeholder: SizedBox.expand(child: _buildThumbnail()), // Fill screen
        subtitleBuilder: (context, subtitle) => Container(
          padding: const EdgeInsets.all(8.0),
          color: Colors.black54,
          child: Text(
            subtitle.toString(),
            style: const TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
      );

      setState(() => _isLoading = false);
    } catch (e) {
      setState(() {
        _error = "Failed to load video: $e";
        _isLoading = false;
      });
    }
  }

  Widget _buildThumbnail() {
  
    return SizedBox.expand(
      child: Stack(
        alignment: Alignment.center,
        children: [
          // CachedNetworkImage(
          //   imageUrl: widget.thumbnailUrl,
          //   placeholder: (context, url) => const Center(
          //     child: CircularProgressIndicator(color: Colors.white),
          //   ),
          //   errorWidget: (context, url, error) =>
          //       const Icon(Icons.broken_image, color: Colors.white, size: 64),
          // ),
          CircularProgressIndicator(color: WhiteColors.white_100),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _chewieController?.dispose();
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            _buildContent(),
            Positioned(
              top: 8,
              left: 8,
              child: IconButton.filled(
                onPressed: () => context.go('/home'),
                icon: SvgPicture.asset(
                  'assets/icons/arrow-left.svg',
                  color: BlackColors.black_500,
                ),
                style: IconButton.styleFrom(
                  backgroundColor: GreyColors.grey_300,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildContent() {
    if (_error != null) {
      return _buildError();
    }

    if (_isImage) {
      return _buildThumbnail();
    }

    if (_isLoading) {
      return _buildThumbnail();
    }

    return Center(
      child: AspectRatio(
        aspectRatio: _controller!.value.aspectRatio,
        child: Chewie(controller: _chewieController!),
      ),
    );
  }

  Widget _buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, color: Colors.white, size: 64),
          const SizedBox(height: 8),
          Text(
            _error!,
            style: const TextStyle(color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 16),
          ElevatedButton(
            onPressed: _initializePlayer,
            child: const Text('Retry'),
          ),
        ],
      ),
    );
  }
}
