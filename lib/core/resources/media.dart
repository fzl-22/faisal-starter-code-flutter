/// Variable instances from assets directory
///
/// Defined asset's path with base prefix according to the
/// asset's type. DO NOT use literal string for asset's path
///
/// ```dart
/// Media.homeIcon;
/// Media.flutterLogo;
/// ```
class Media {
  const Media._();

  static const _baseIcon = 'assets/icons';
  static const _baseImage = 'assets/images';

  // Icons
  static const homeIcon = '$_baseIcon/home.svg';

  // Images
  static const flutterLogo = '$_baseImage/flutter_logo.svg';
  static const dartLogo = '$_baseImage/dart_logo.svg';
}
