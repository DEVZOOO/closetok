import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 영상 업로드 버튼
class PostButton extends StatelessWidget {
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = theme.colorScheme.background;
    final onbg = theme.colorScheme.onBackground;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          right: -5,
          child: Container(
            width: 30,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size7),
              color: const Color(0xffB6D6F2),
            ),
          ),
        ),
        Positioned(
          left: -5,
          child: Container(
            width: 30,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size7),
              color: theme.primaryColor,
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: 40,
            height: 35,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size7),
              color: onbg,
            ),
          ),
        ),
        Positioned(
          child: FaIcon(
            FontAwesomeIcons.plus,
            size: Sizes.size20,
            color: bg,
          ),
        ),
      ],
    );
  }
}
