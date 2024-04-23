import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';

/// 인증(회원가입/로그인) submit 버튼
class SubmitButton extends StatelessWidget {
  final String text;
  final Function()? onTap;
  final Color bgColor;
  final Color? color;
  final Color? borderColor;

  const SubmitButton({
    super.key,
    required this.text,
    this.onTap,
    this.color = Colors.white,
    required this.bgColor,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          vertical: Sizes.size14,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          border: borderColor != null
              ? Border.all(
                  color: borderColor!,
                )
              : null,
          borderRadius: BorderRadius.circular(Sizes.size3),
        ),
        alignment: Alignment.center,
        child: Text(
          text,
          style: theme.textTheme.labelLarge?.copyWith(
            color: color,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
