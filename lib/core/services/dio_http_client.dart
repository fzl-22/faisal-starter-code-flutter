import 'package:dio/dio.dart';
import 'package:faisal_starter_code_flutter/core/env/env.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioHttpClient {
  const DioHttpClient._();

  static Dio get instance {
    final dio = Dio(_options)..interceptors.add(_requestInterceptor);

    // only log network request when in debug mode
    if (kDebugMode) dio.interceptors.add(_loggerInterceptor);

    return dio;
  }

  static BaseOptions get _options => BaseOptions(
        baseUrl: Env.baseUrl,
        sendTimeout: const Duration(seconds: 60),
        connectTimeout: const Duration(seconds: 60),
        receiveTimeout: const Duration(seconds: 60),
        headers: {
          Headers.contentTypeHeader: Headers.jsonContentType,
          Headers.acceptHeader: Headers.acceptHeader,
        },
      );

  static Interceptor get _requestInterceptor => RequestInterceptor();

  static Interceptor get _loggerInterceptor => TalkerDioLogger();
}

class RequestInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final accessToken = options.extra['accessToken'] as String?;

    if (accessToken != null) {
      options.headers.addAll({'authorization': 'Bearer $accessToken'});
    }

    super.onRequest(options, handler);
  }
}
