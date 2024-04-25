import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 영상 업로드 버튼
class PostButton extends StatelessWidget {
  final double w = 45;
  final double h = 35;
  const PostButton({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final bg = theme.colorScheme.background;
    final onBgColor = theme.colorScheme.onBackground;

    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Positioned(
          right: -5,
          child: Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size10),
              color: const Color(0xffB6D6F2),
            ),
          ),
        ),
        Positioned(
          left: -5,
          child: Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size10),
              color: theme.primaryColor,
            ),
          ),
        ),
        Positioned(
          child: Container(
            width: w,
            height: h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(Sizes.size10),
              color: onBgColor,
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
