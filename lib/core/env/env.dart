import 'package:envied/envied.dart';

part 'env.g.dart';

/// [Env]
///
/// Environment variable exposure by [Envied] from .env file.
/// If the value of the variables is sensitive, consider to
/// set `obfuscate` to `true`. Otherwise, do not.
///
/// Example:
///
/// ```dart
/// @EnviedField(obfuscate: true)
/// static const String foo = _Env.foo;
/// ```
@Envied(useConstantCase: true, requireEnvFile: true)
abstract class Env {
  @EnviedField()
  static const String baseUrl = _Env.baseUrl;
}
