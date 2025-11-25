import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'package:share_plus/share_plus.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

/// Widget موحد لتشغيل الفيديوهات من مصادر مختلفة
class UniversalVideoViewer extends StatelessWidget {
  const UniversalVideoViewer({super.key, this.videoFile, this.videoUrl})
    : assert(
        videoFile != null || videoUrl != null,
        'يجب تمرير إما videoFile أو videoUrl',
      );

  final File? videoFile;
  final String? videoUrl;

  bool _isYouTubeUrl(String url) {
    return url.contains('youtube.com') ||
        url.contains('youtu.be') ||
        url.contains('youtube-nocookie.com');
  }

  @override
  Widget build(BuildContext context) {
    // إذا كان ملف محلي أو رابط عادي
    if (videoFile != null || (videoUrl != null && !_isYouTubeUrl(videoUrl!))) {
      return VideoViewer(vidioFile: videoFile, onlineVidioFile: videoUrl);
    }

    // إذا كان رابط YouTube
    if (videoUrl != null && _isYouTubeUrl(videoUrl!)) {
      return YouTubeVideoViewer(youtubeUrl: videoUrl!);
    }

    return const Center(
      child: Text('نوع الفيديو غير مدعوم', style: TextStyle(color: Colors.red)),
    );
  }
}

// ==================== YouTubeVideoViewer ====================
class YouTubeVideoViewer extends StatefulWidget {
  const YouTubeVideoViewer({super.key, required this.youtubeUrl});

  final String youtubeUrl;

  @override
  State<YouTubeVideoViewer> createState() => _YouTubeVideoViewerState();
}

class _YouTubeVideoViewerState extends State<YouTubeVideoViewer> {
  late YoutubePlayerController _controller;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializePlayer();
  }

  void _initializePlayer() {
    try {
      final videoId = YoutubePlayer.convertUrlToId(widget.youtubeUrl);

      if (videoId == null) {
        setState(() {
          _hasError = true;
          _errorMessage = 'رابط YouTube غير صحيح';
        });
        return;
      }

      _controller = YoutubePlayerController(
        initialVideoId: videoId,
        flags: const YoutubePlayerFlags(autoPlay: false),
      );
    } catch (e) {
      setState(() {
        _hasError = true;
        _errorMessage = e.toString();
      });
      // print('خطأ في تحميل فيديو YouTube: $e');
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              const Text(
                'فشل تحميل فيديو YouTube',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  _errorMessage ?? 'حدث خطأ غير معروف',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hasError = false;
                    _errorMessage = null;
                  });
                  _initializePlayer();
                },
                child: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        ),
      );
    }

    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.red,
      progressColors: const ProgressBarColors(
        playedColor: Colors.red,
        handleColor: Colors.redAccent,
        bufferedColor: Colors.white54,
        backgroundColor: Colors.white24,
      ),
      topActions: [
        const SizedBox(width: 8.0),
        Expanded(
          child: Text(
            _controller.metadata.title,
            style: const TextStyle(color: Colors.white, fontSize: 18.0),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ),
      ],
      onReady: () {
        // print('YouTube Player is ready.');
      },
      onEnded: (data) {
        // print('Video ended.');
      },
    );
  }
}

// ==================== VideoViewer للفيديوهات العادية ====================
class VideoViewer extends StatefulWidget {
  const VideoViewer({super.key, this.vidioFile, this.onlineVidioFile})
    : assert(
        vidioFile != null || onlineVidioFile != null,
        'يجب تمرير إما vidioFile أو onlineVidioFile',
      );

  final File? vidioFile;
  final String? onlineVidioFile;

  @override
  VideoViewerState createState() => VideoViewerState();
}

class VideoViewerState extends State<VideoViewer> {
  late VideoPlayerController _controller;
  bool _isEnded = false;
  bool _showControls = true;
  Timer? _hideTimer;
  Timer? _progressTimer;
  Duration _currentPosition = Duration.zero;
  bool _hasError = false;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _initializeVideo();
  }

  Future<void> _initializeVideo() async {
    try {
      if (widget.vidioFile != null) {
        _controller = VideoPlayerController.file(widget.vidioFile!);
      } else {
        _controller = VideoPlayerController.networkUrl(
          Uri.parse(widget.onlineVidioFile!),
        );
      }

      await _controller.initialize();

      if (mounted) {
        setState(() {
          _hasError = false;
        });
      }

      _controller.addListener(_videoListener);
      _startProgressTimer();
    } catch (e) {
      if (mounted) {
        setState(() {
          _hasError = true;
          _errorMessage = e.toString();
        });
      }
      // print('خطأ في تحميل الفيديو: $e');
    }
  }

  void _videoListener() {
    if (_controller.value.position >= _controller.value.duration &&
        !_controller.value.isPlaying &&
        !_isEnded) {
      setState(() {
        _isEnded = true;
      });
    } else if (_controller.value.isPlaying && _isEnded) {
      setState(() {
        _isEnded = false;
      });
    }
    setState(() {
      _currentPosition = _controller.value.position;
    });
  }

  void _startProgressTimer() {
    _progressTimer?.cancel();
    _progressTimer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted && _controller.value.isInitialized) {
        setState(() {
          _currentPosition = _controller.value.position;
        });
      }
    });
  }

  void _toggleControls() {
    setState(() {
      _showControls = !_showControls;
    });
    if (_showControls) {
      _hideTimer?.cancel();
      _hideTimer = Timer(const Duration(seconds: 3), () {
        if (mounted) {
          setState(() {
            _showControls = false;
          });
        }
      });
    }
  }

  @override
  void dispose() {
    _controller.removeListener(_videoListener);
    _controller.dispose();
    _hideTimer?.cancel();
    _progressTimer?.cancel();
    super.dispose();
  }

  String _formatDuration(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours > 0) {
      return "${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds";
    } else {
      return "$twoDigitMinutes:$twoDigitSeconds";
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_hasError) {
      return Container(
        color: Colors.black,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: Colors.red, size: 64),
              const SizedBox(height: 16),
              const Text(
                'فشل تحميل الفيديو',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  _errorMessage ?? 'حدث خطأ غير معروف',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _hasError = false;
                    _errorMessage = null;
                  });
                  _initializeVideo();
                },
                child: const Text('إعادة المحاولة'),
              ),
            ],
          ),
        ),
      );
    }

    return _controller.value.isInitialized
        ? GestureDetector(
            onTap: _toggleControls,
            child: Stack(
              alignment: Alignment.center,
              children: [
                SizedBox.expand(
                  child: FittedBox(
                    fit: BoxFit.fill,
                    child: SizedBox(
                      width: _controller.value.size.width,
                      height: _controller.value.size.height,
                      child: VideoPlayer(_controller),
                    ),
                  ),
                ),
                if ((_isEnded || !_controller.value.isPlaying) && _showControls)
                  Container(
                    color: Colors.black45,
                    child: IconButton(
                      icon: const Icon(
                        Icons.play_arrow,
                        color: Colors.white,
                        size: 64,
                      ),
                      onPressed: () {
                        setState(() {
                          if (_isEnded) {
                            _controller.seekTo(Duration.zero);
                          }
                          _controller.play();
                          _isEnded = false;
                          _showControls = false;
                        });
                      },
                    ),
                  ),
                if (_showControls)
                  Positioned(
                    bottom: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      color: Colors.black54,
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Row(
                        children: [
                          IconButton(
                            icon: const Icon(
                              Icons.replay_10,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              final newPosition =
                                  _controller.value.position -
                                  const Duration(seconds: 10);
                              _controller.seekTo(
                                newPosition > Duration.zero
                                    ? newPosition
                                    : Duration.zero,
                              );
                            },
                          ),
                          IconButton(
                            icon: Icon(
                              _controller.value.isPlaying
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                if (_controller.value.isPlaying) {
                                  _controller.pause();
                                } else {
                                  if (_isEnded) {
                                    _controller.seekTo(Duration.zero);
                                  }
                                  _controller.play();
                                  _isEnded = false;
                                }
                              });
                            },
                          ),
                          IconButton(
                            icon: const Icon(
                              Icons.forward_10,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              final maxPosition = _controller.value.duration;
                              final newPosition =
                                  _controller.value.position +
                                  const Duration(seconds: 10);
                              _controller.seekTo(
                                newPosition < maxPosition
                                    ? newPosition
                                    : maxPosition,
                              );
                            },
                          ),
                          Text(
                            _formatDuration(_currentPosition),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          Expanded(
                            child: Slider(
                              max: _controller.value.duration.inMilliseconds
                                  .toDouble(),
                              value: _currentPosition.inMilliseconds
                                  .clamp(
                                    0,
                                    _controller.value.duration.inMilliseconds,
                                  )
                                  .toDouble(),
                              onChanged: (value) {
                                setState(() {
                                  _controller.seekTo(
                                    Duration(milliseconds: value.toInt()),
                                  );
                                });
                              },
                              activeColor: Colors.red,
                              inactiveColor: Colors.white70,
                            ),
                          ),
                          Text(
                            _formatDuration(_controller.value.duration),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(width: 8),
                          IconButton(
                            icon: const Icon(
                              Icons.fullscreen,
                              color: Colors.white,
                            ),
                            onPressed: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => Scaffold(
                                    backgroundColor: Colors.black,
                                    body: SafeArea(
                                      child: Center(
                                        child: GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              SizedBox.expand(
                                                child: FittedBox(
                                                  fit: BoxFit.fill,
                                                  child: SizedBox(
                                                    width: _controller
                                                        .value
                                                        .size
                                                        .width,
                                                    height: _controller
                                                        .value
                                                        .size
                                                        .height,
                                                    child: VideoPlayer(
                                                      _controller,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                              setState(() {
                                _showControls = true;
                              });
                            },
                          ),
                          if (widget.vidioFile != null)
                            IconButton(
                              icon: const Icon(
                                Icons.share,
                                color: Colors.white,
                              ),
                              onPressed: () async {
                                await Share.shareXFiles([
                                  XFile(widget.vidioFile!.path),
                                ]);
                              },
                            ),
                        ],
                      ),
                    ),
                  ),
              ],
            ),
          )
        : const Center(child: CircularProgressIndicator(color: Colors.red));
  }
}
