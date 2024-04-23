import 'package:flutter/material.dart';

/// 다크모드 여부
bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;

/// snackbar 표시
void showSnackbar(BuildContext context, String txt) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(txt),
      showCloseIcon: true,
    ),
  );
}
