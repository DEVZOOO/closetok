import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 영상 오른쪽 버튼
class UtilButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function()? onTap;
  const UtilButton({
    super.key,
    required this.text,
    required this.icon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FaIcon(
            icon,
            color: Colors.white,
            size: Sizes.size32,
          ),
          Gaps.v2,
          Text(text),
        ],
      ),
    );
  }
}
