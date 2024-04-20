import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class AuthBoxButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function() onTap;
  const AuthBoxButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          padding: const EdgeInsets.symmetric(
            vertical: Sizes.size10,
            horizontal: Sizes.size16,
          ),
          decoration: BoxDecoration(
            border: Border.all(
              color: theme.disabledColor,
            ),
            borderRadius: BorderRadius.circular(Sizes.size3),
          ),
          child: Stack(
            children: [
              Positioned(
                child: FaIcon(icon),
              ),
              Positioned.fill(
                child: Center(
                  child: Text(
                    text,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
