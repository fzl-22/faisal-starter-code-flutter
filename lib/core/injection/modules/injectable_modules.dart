import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  http.Client get httpClient => http.Client();
}
