import 'package:dio/dio.dart';
import 'package:faisal_starter_code_flutter/core/services/dio_http_client.dart';
import 'package:injectable/injectable.dart';

@module
abstract class InjectableModules {
  @lazySingleton
  Dio get dio => DioHttpClient.instance;
}
