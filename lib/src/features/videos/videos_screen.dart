import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/videos/widgets/comments.dart';
import 'package:closetok/src/features/videos/widgets/util_button.dart';
import 'package:closetok/src/features/videos/widgets/video_post.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:video_player/video_player.dart';

/// Video 화면
class VideosScreen extends StatefulWidget {
  static const String routeUrl = "video";
  static const String routeName = "videoScreen";
  const VideosScreen({super.key});

  @override
  State<VideosScreen> createState() => _VideosScreenState();
}

class _VideosScreenState extends State<VideosScreen> {
  late VideoPlayerController _controller;
  List<String> videos = [
    "assets/videos/snowing.mp4",
    "assets/videos/snowing.mp4",
    "assets/videos/snowing.mp4",
  ];

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  /// 비디오 변경
  void _onPageChange(index) {
    // 마지막 직전이면 다음 데이터 fetch
    if (index == videos.length - 2) {
      if (kDebugMode) {
        print('fetch new videos');
      }
      videos.addAll([
        "assets/videos/snowing.mp4",
        "assets/videos/snowing.mp4",
      ]);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      children: [
        // video
        Positioned.fill(
          child: PageView.builder(
            onPageChanged: _onPageChange,
            scrollDirection: Axis.vertical,
            itemCount: videos.length,
            itemBuilder: (context, index) {
              final video = videos[index];
              return VideoPost(
                index: index,
                url: video,
              );
            },
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
                  onTap: () {
                    showBottomSheet(
                      context: context,
                      builder: (context) {
                        return const Comments();
                      },
                    );
                  },
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
    );
  }
}
