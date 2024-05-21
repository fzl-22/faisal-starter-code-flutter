import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';

/// [GeneralException]
///
/// Takes [message] description to forms
/// a throwable [GeneralException] for developer-defined error-handling.
///
/// ```dart
/// try {
///   ...
/// } catch (e) {
///   throw GeneralException(
///     message: 'An unknown error occurred',
///   );
/// }
/// ```
class GeneralException extends Equatable implements Exception {
  const GeneralException({
    required this.message,
  });

  final String message;

  @override
  List<Object?> get props => [message];
}

/// [CacheException]
///
/// Takes required [message] description to forms
/// a throwable [CacheException] for cache-related error-handling
///
/// ```dart
/// try {
///   ...
/// } catch (e) {
///   throw CacheException(
///     message: e.toString(),
///   );
/// }
/// ```
class CacheException extends Equatable implements Exception {
  const CacheException({
    required this.message,
    this.prefix = 'Cache Exception',
  });

  final String message;
  final String prefix;

  @override
  List<Object?> get props => [message, prefix];
}

/// [ClientException]
///
/// Throw when there is an error occured on the client side,
/// such as inactive internet connection or a platform exception.
/// [message] can be generated from exception's stack trace.
///
/// ```dart
/// try {
///   ...
/// } on http.ClientException catch (e) {
///   throw ClientException(
///     message: 'A client error occurred',
///   );
/// }
/// ```
class ClientException extends Equatable implements Exception {
  const ClientException({
    required this.message,
    this.prefix = 'Client-Side Error',
  });

  final String prefix;
  final String message;

  @override
  List<Object?> get props => [prefix, message];
}

/// [HttpException]
///
/// Takes [message] description and HTTP [statusCode] to
/// forms a throwable [HttpException] for API-related error-handling.
///
/// ```dart
/// try {
///   final response = await http.get(...);
///   ...
///   if (response.statusCode != 200 || response.statusCode != 201) {
///     throw HttpException(
///       message: response.body,
///       statusCode: response.statusCode,
///     );
///   }
/// } on HttpException {
///   rethrow;
/// }
/// ```
class HttpException extends Equatable implements Exception {
  const HttpException({
    required this.statusCode,
    required this.message,
  });

  /// Instantiates a new [HttpException] from [DioException].
  ///
  /// Example:
  /// ```dart
  /// try {
  ///   ...
  /// } on DioException catch (e) {
  ///   throw HttpException.fromDio(e)
  /// }
  /// ```
  factory HttpException.fromDio(DioException exception) {
    int? statusCode;
    String? message;

    switch (exception.type) {
      case DioExceptionType.connectionError:
        statusCode = 503;
        message = exception.error.toString();
      case DioExceptionType.connectionTimeout:
        statusCode = 504;
        message = 'Connection timed out';
      case DioExceptionType.cancel:
        statusCode = 499;
        message = 'Request to API server was cancelled';
      case DioExceptionType.sendTimeout:
        statusCode = 408;
        message = 'Send timeout error';
      case DioExceptionType.receiveTimeout:
        statusCode = 504;
        message = 'Receive timeout error';
      case DioExceptionType.badCertificate:
        statusCode = 495;
        message = 'Bad certificate error';
      case DioExceptionType.badResponse:
        statusCode = exception.response?.statusCode ?? 500;
        message = message ??=
            (exception.response?.data as DataMap?)?['message'] as String? ??
                'Oops, something went wrong. Please try again later';
      case DioExceptionType.unknown:
        statusCode = 520;
        message = 'Oops, something went wrong. Please try again later';
    }

    return HttpException(
      statusCode: statusCode,
      message: message,
    );
  }

  final int statusCode;
  final String message;

  @override
  List<Object?> get props => [message, statusCode];
}
