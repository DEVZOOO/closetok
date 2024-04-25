import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/constants/utils.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 탭 메누
class NavMenu extends StatelessWidget {
  final bool isFocus;
  final String text;
  final IconData icon;
  final Function() onTap;
  const NavMenu({
    super.key,
    required this.text,
    required this.icon,
    required this.isFocus,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final color = Colors.grey.shade500;
    final focusColor = theme.colorScheme.onBackground;

    return Expanded(
      child: GestureDetector(
        behavior: HitTestBehavior.translucent, // 빈공간도 이벤트 발생
        onTap: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            FaIcon(
              icon,
              color: isFocus ? focusColor : color,
              size: Sizes.size20,
            ),
            Gaps.v2,
            Text(
              text,
              style: TextStyle(
                color: isFocus ? focusColor : color,
                fontSize: textTheme.labelSmall?.fontSize,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
