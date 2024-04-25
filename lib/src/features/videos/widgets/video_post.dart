import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// 비디오 위젯
class VideoPost extends StatefulWidget {
  final String url;
  final int index;
  const VideoPost({
    super.key,
    required this.url,
    required this.index,
  });

  @override
  State<VideoPost> createState() => _VideoPostState();
}

class _VideoPostState extends State<VideoPost>
    with SingleTickerProviderStateMixin {
  late final VideoPlayerController _controller =
      VideoPlayerController.asset(widget.url);

  bool _isPlaying = false;

  final Duration _duration = const Duration(milliseconds: 150);

  late final AnimationController _animationController = AnimationController(
    vsync: this,
    duration: _duration,
    lowerBound: 1,
    upperBound: 1.5,
    value: 1,
  );

  @override
  void initState() {
    super.initState();

    // init video
    _initVideo();
  }

  /// video controller 초기화
  void _initVideo() async {
    await _controller.initialize();

    _controller.setLooping(true); // 반복재생
    _controller.setVolume(kIsWeb ? 0 : 1); // 볼륨설정

    // TODO - 자동재생

    setState(() {});
  }

  /// 비디오 토글
  void _toggleVideo() {
    if (_controller.value.isPlaying) {
      _controller.pause();
      _animationController.reverse();
    } else {
      _controller.play();
      _animationController.forward();
    }

    _isPlaying = !_isPlaying;
    setState(() {});
  }

  /// view 변경됨
  void _visibilityChange(info) {
    if (kDebugMode) {
      print(info);
    }
    // 안보이면
    if (info.visibleFraction != 1 && _isPlaying) {
      _toggleVideo();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return VisibilityDetector(
      key: Key('${widget.index}'),
      onVisibilityChanged: _visibilityChange,
      child: GestureDetector(
        onTap: _toggleVideo,
        child: _controller.value.isInitialized
            ? Stack(
                children: [
                  // 비디오
                  Positioned.fill(
                    child: VideoPlayer(_controller),
                  ),

                  // 재생
                  Positioned(
                    child: Center(
                      child: AnimatedBuilder(
                        animation: _animationController,
                        builder: (context, child) {
                          return Transform.scale(
                            scale: _animationController.value,
                            child: AnimatedOpacity(
                              opacity: _isPlaying ? 0 : 1,
                              duration: _duration,
                              child: const FaIcon(
                                FontAwesomeIcons.play,
                                size: Sizes.size60,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              )
            : const Placeholder(),
      ),
    );
  }
}
