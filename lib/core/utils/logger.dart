import 'package:logger/logger.dart';

/// [AppLogger]
///
/// Provides debug information message. Wrapper of [Logger] API.
/// This logger will omit any log when in release mode.
class AppLogger {
  const AppLogger._();

  static final _logger = Logger(
    printer: PrettyPrinter(),
    filter: DevelopmentFilter(),
  );

  /// Log a message at level [Level.debug]
  static void debug(dynamic message) {
    _logger.d(message);
  }

  /// Log a message at level [Level.error]
  static void error(dynamic message) {
    _logger.e(message);
  }

  /// Log a message at level [Level.fatal]
  static void fatal(dynamic message) {
    _logger.f(message);
  }

  /// Log a message at level [Level.info]
  static void info(dynamic message) {
    _logger.i(message);
  }

  /// Log a message at level [Level.trace]
  static void trace(dynamic message) {
    _logger.t(message);
  }

  /// Log a message at level [Level.warning]
  static void warning(dynamic message) {
    _logger.w(message);
  }
}
