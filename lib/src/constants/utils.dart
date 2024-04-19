import 'package:flutter/material.dart';

/// 다크모드 여부
bool isDarkMode(BuildContext context) =>
    MediaQuery.of(context).platformBrightness == Brightness.dark;
