import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// input text
class InputText extends StatelessWidget {
  final TextEditingController controller;
  final String? hintText;
  final bool isHide;
  final TextInputType? keyboardType;
  final Widget? suffixWidget;

  const InputText({
    super.key,
    required this.controller,
    this.hintText,
    this.isHide = false,
    this.keyboardType,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.only(
          left: Sizes.size8,
        ),
        hintText: hintText,
        hintStyle: theme.textTheme.bodyLarge?.copyWith(
          color: theme.disabledColor,
        ),
        suffix: suffixWidget,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.disabledColor,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: theme.disabledColor,
          ),
        ),
      ),
      cursorColor: theme.primaryColor,
      autofocus: true,
      obscureText: isHide,
      keyboardType: keyboardType,
    );
  }
}
