import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:talker_dio_logger/talker_dio_logger.dart';

class DioHttpClient {
  const DioHttpClient._();

  static Dio get instance => Dio(_options)
    ..interceptors.add(_requestInterceptor)
    ..interceptors.add(_loggerInterceptor);

  static BaseOptions get _options => BaseOptions(
        baseUrl: dotenv.env['BASE_URL']!,
        sendTimeout: const Duration(seconds: 10),
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
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
