import 'package:flutter/material.dart';

/// Defined project-level color palletes
///
/// DO use colors defined in [Colours] instead of
/// built-in Flutter's [Color] or [Colors].
///
/// ```dart
/// Colours.blue50
/// Colours.error400
/// ```
class Colours {
  const Colours._();

  // General
  static const white = Color(0xFFFFFFFF);
  static const transparent = Color.fromARGB(0, 0, 0, 0);
  static const generalText = Color(0xFF242424);

  // Blue
  static const blue50 = Color(0xFFE3F2FD);
  static const blue100 = Color(0xFFBBDEFB);
  static const blue200 = Color(0xFF90CAF9);
  static const blue300 = Color(0xFF64B5F6);
  static const blue400 = Color(0xFF42A5F5);
  static const blue500 = Color(0xFF2196F3);
  static const blue600 = Color(0xFF1E88E5);
  static const blue700 = Color(0xFF1976D2);
  static const blue800 = Color(0xFF1565C0);
  static const blue900 = Color(0xFF0D47A1);

  // Warning
  static const warning50 = Color(0xFFFCFCE6);
  static const warning100 = Color(0xFFF5F7B2);
  static const warning200 = Color(0xFFF1F38D);
  static const warning300 = Color(0xFFEAED59);
  static const warning400 = Color(0xFFE6E939);
  static const warning500 = Color(0xFFE0E407);
  static const warning600 = Color(0xFFCCCF06);
  static const warning700 = Color(0xFF9FA205);
  static const warning800 = Color(0xFF7B7D04);
  static const warning900 = Color(0xFF5E6003);

  // Error
  static const error50 = Color(0xFFFCE6E6);
  static const error100 = Color(0xFFF7B2B2);
  static const error200 = Color(0xFFF38D8D);
  static const error300 = Color(0xFFED5959);
  static const error400 = Color(0xFFE93939);
  static const error500 = Color(0xFFE40707);
  static const error600 = Color(0xFFCF0606);
  static const error700 = Color(0xFFA20505);
  static const error800 = Color(0xFF7D0404);
  static const error900 = Color(0xFF600303);

  // Success
  static const success50 = Color(0xFFEFFEE6);
  static const success100 = Color(0xFFCEFAB0);
  static const success200 = Color(0xFFB6F88A);
  static const success300 = Color(0xFF94F554);
  static const success400 = Color(0xFF80F333);
  static const success500 = Color(0xFF60F000);
  static const success600 = Color(0xFF57DA00);
  static const success700 = Color(0xFF44AA00);
  static const success800 = Color(0xFF358400);
  static const success900 = Color(0xFF286500);

  // Grey
  static const grey50 = Color(0xFFFAFAFA);
  static const grey100 = Color(0xFFF0F0F0);
  static const grey200 = Color(0xFFE9E9E9);
  static const grey300 = Color(0xFFDFDFDF);
  static const grey400 = Color(0xFFD9D9D9);
  static const grey500 = Color(0xFFCFCFCF);
  static const grey600 = Color(0xFFBCBCBC);
  static const grey700 = Color(0xFF939393);
  static const grey800 = Color(0xFF727272);
  static const grey900 = Color(0xFF575757);

  // Gold
  static const gold50 = Color(0xFFFCF7EB);
  static const gold100 = Color(0xFFF5E5C0);
  static const gold200 = Color(0xFFF0D8A1);
  static const gold300 = Color(0xFFE9C776);
  static const gold400 = Color(0xFFE5BC5C);
  static const gold500 = Color(0xFFDEAB33);
  static const gold600 = Color(0xFFCA9C2E);
  static const gold700 = Color(0xFF9E7924);
  static const gold800 = Color(0xFF7A5E1C);
  static const gold900 = Color(0xFF5D4815);

  // Gradient
  static const gradientBlue = [blue300, blue500];
}
