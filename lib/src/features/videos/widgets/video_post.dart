import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/videos/widgets/comments.dart';
import 'package:closetok/src/features/videos/widgets/util_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

/// 비디오 위젯
class VideoPost extends StatefulWidget {
  // TODO - VideoModel로 변경
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

  bool _isPlaying = true;

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

    // TODO - fetch comments
  }

  /// video controller 초기화
  void _initVideo() async {
    await _controller.initialize();

    _controller.setLooping(true); // 반복재생
    _controller.setVolume(kIsWeb ? 0 : 1); // 볼륨설정
    _controller.play(); // 무조건 재생

    setState(() {});
  }

  /// 비디오 재생/일시정지
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
      print(info.visibleFraction);
    }

    // 안보이면 일시정지 처리
    if (info.visibleFraction != 1 && _isPlaying) {
      _toggleVideo();
    }
  }

  /// 댓글 버튼 탭
  void _onTapCommentButton() async {
    var afterPlay = false;
    if (_isPlaying) {
      afterPlay = true;
      _toggleVideo();
    }
    await showModalBottomSheet(
      isScrollControlled: true,
      enableDrag: false,
      context: context,
      builder: (context) {
        return const Comments();
      },
    );
    if (afterPlay) {
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
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

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

                  // info(bottom)
                  Positioned(
                    left: Sizes.size16,
                    bottom: Sizes.size16,
                    child: DefaultTextStyle(
                      style: textTheme.bodyLarge!.copyWith(
                        color: Colors.white,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // name
                          Text(
                            '@Judy',
                            style: TextStyle(
                              fontSize: textTheme.titleMedium?.fontSize,
                              fontWeight: textTheme.titleMedium?.fontWeight,
                            ),
                          ),
                          Gaps.v16,

                          // title
                          const Text('This is actually the place 😆'),

                          // tags
                          const Text('#tags'),
                          Gaps.v8,

                          // music
                          const Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              FaIcon(
                                FontAwesomeIcons.music,
                                size: Sizes.size16,
                                color: Colors.white,
                              ),
                              Gaps.h10,
                              Text('BTS - Permission to Dance'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  // util buttons(right)
                  Positioned(
                    right: Sizes.size16,
                    bottom: Sizes.size16,
                    child: DefaultTextStyle(
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: theme.textTheme.labelMedium?.fontSize,
                        fontWeight: FontWeight.w500,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 프사
                          CircleAvatar(
                            radius: Sizes.size24,
                            // dummy image
                            foregroundImage: const NetworkImage(
                                "https://avatars.githubusercontent.com/u/104175767?v=4"),
                            backgroundColor: theme.primaryColor,
                            child: const Text(
                              "Judy",
                            ),
                          ),

                          Gaps.v20,

                          // 좋아요
                          const UtilButton(
                            text: "2.9M",
                            icon: FontAwesomeIcons.solidHeart,
                          ),

                          Gaps.v20,

                          // 댓글
                          UtilButton(
                            text: "33.0K",
                            icon: FontAwesomeIcons.solidComment,
                            onTap: _onTapCommentButton,
                          ),

                          Gaps.v20,

                          // 공유
                          const UtilButton(
                            text: "Share",
                            icon: FontAwesomeIcons.share,
                          ),

                          Gaps.v30,
                        ],
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
