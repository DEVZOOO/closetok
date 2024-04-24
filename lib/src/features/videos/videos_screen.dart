import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/videos/widgets/util_button.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// Video 화면
class VideosScreen extends StatelessWidget {
  static const String routeUrl = "video";
  static const String routeName = "videoScreen";
  const VideosScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Stack(
      children: [
        // video
        Positioned.fill(
          child: Container(
            color: theme.colorScheme.tertiaryContainer,
          ),
        ),

        // info
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

        // util buttons
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
                  radius: Sizes.size28,
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
                    text: "2.9M", icon: FontAwesomeIcons.solidHeart),

                Gaps.v20,

                // 댓글
                const UtilButton(
                  text: "33.0K",
                  icon: FontAwesomeIcons.solidComment,
                ),

                Gaps.v20,

                // 공유
                const UtilButton(
                  text: "Share",
                  icon: FontAwesomeIcons.share,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
