import 'package:faisal_starter_code_flutter/core/resources/colours.dart';
import 'package:faisal_starter_code_flutter/core/resources/fonts.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final theme = ThemeData(
    colorScheme: const ColorScheme.light(
      primary: Colours.blue500,
      secondary: Colours.gold500,
      error: Colours.error500,
      background: Colours.grey50,
    ),
    fontFamily: Fonts.poppins,
    useMaterial3: true,
  );
}
