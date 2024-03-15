import 'package:flutter/material.dart';

/// [ContextExtension]
///
/// Provides additional functionality to the [BuildContext],
/// allowing convenient access to common properties such as theme data,
/// media queries, size information, and etc.
///
/// Usage in a widget
/// ```dart
/// class MyWidget extends StatelessWidget {
///   @override
///   Widget build(BuildContext context) {
///     ThemeData theme = context.theme;
///     MediaQueryData mediaQuery = context.mediaQuery;
///     TargetPlatform platform = context.platform;
///     ColorScheme colorScheme = context.colorScheme;
///     Size size = context.size;
///     double width = context.width;
///     double height = context.height;
///   }
/// }
/// ```
///
extension ContextExtension on BuildContext {
  /// Retrieves the current [ThemeData] based on the [BuildContext].
  ThemeData get theme => Theme.of(this);

  /// Retrieves the current [MediaQueryData] based on the [BuildContext].
  MediaQueryData get mediaQuery => MediaQuery.of(this);

  /// Retrieves the current [FocusScopeNode] based on the [BuildContext].
  FocusScopeNode get focusScope => FocusScope.of(this);

  /// Retrieves the current [ScaffoldMessengerState] to show [SnackBar] or
  ScaffoldMessengerState get scaffoldMessenger => ScaffoldMessenger.of(this);

  /// Retrieves the current [TargetPlatform] based on the [BuildContext].
  /// It is extracted from the [ThemeData] of the application.
  TargetPlatform get platform => theme.platform;

  /// Retrieves the current [TextTheme] based on the [BuildContext].
  /// It is extracted from the [ThemeData] of the application.
  TextTheme get textTheme => theme.textTheme;

  /// Retrieves the current [ColorScheme] based on the [BuildContext].
  /// It is extracted from the [ThemeData] of the application.
  ColorScheme get colorScheme => theme.colorScheme;

  /// Retrieves the size of the current screen based on the [BuildContext].
  /// It is extracted from the [MediaQueryData] of the application.
  Size get size => mediaQuery.size;

  /// Retrieves the view insets of the current screen bansed on the
  /// [BuildContext]. It is extracted from the [MediaQueryData] of the
  /// application.
  EdgeInsets get viewInsets => mediaQuery.viewInsets;

  /// Retrieves the width of the current screen based on the [BuildContext].
  /// It is extracted from the [MediaQueryData] of the application.
  double get width => size.width;

  /// Retrieves the height of the current screen based on the [BuildContext].
  /// It is extracted from the [MediaQueryData] of the application.
  double get height => size.height;

  /// Removes focus from a node that has the primary focus
  void unfocus() => focusScope.unfocus();

  /// Requests the primary focus for this node
  void requestFocus(FocusNode focusNode) => focusScope.requestFocus(focusNode);

  /// Request to move the focus to the next focus node
  void nextFocus() => focusScope.nextFocus();

  /// Request to move the focus to the previous focus node
  void previousFocus() => focusScope.previousFocus();

  /// Removes all the snackBars currently in queue
  void clearSnackBars() => scaffoldMessenger.clearSnackBars();

  /// Shows a [SnackBar] across all registered [Scaffold]s.
  void showSnackBar(SnackBar snackBar) =>
      scaffoldMessenger.showSnackBar(snackBar);
}
