import 'package:equatable/equatable.dart';

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

/// [ServerException]
///
/// Takes [message] description and HTTP [statusCode] and custom [prefix] to
/// forms a throwable [ServerException] for API-related error-handling.
///
/// ```dart
/// try {
///   final response = await http.get(...);
///   ...
///   if (response.statusCode != 200 || response.statusCode != 201) {
///     throw ServerException(
///       message: response.body,
///       statusCode: response.statusCode,
///     );
///   }
/// } on ServerException {
///   rethrow;
/// }
/// ```
class ServerException extends Equatable implements Exception {
  const ServerException({
    required this.statusCode,
    required this.message,
    this.prefix = '',
  });

  final int statusCode;
  final String message;
  final String prefix;

  @override
  List<Object?> get props => [message, statusCode, prefix];
}

/// Throws when an invalid / bad request is encountered
class BadRequestException extends ServerException {
  const BadRequestException({
    required super.message,
  }) : super(statusCode: 400, prefix: 'Bad Request');
}

/// Throw when the API calls is unauthorized
class UnauthorizedException extends ServerException {
  const UnauthorizedException({
    required super.message,
  }) : super(statusCode: 401, prefix: 'Unauthorized Error');
}

/// Throw when the API calls got payment errors
class PaymentException extends ServerException {
  const PaymentException({
    required super.message,
  }) : super(statusCode: 402, prefix: 'Payment Error');
}

/// Throw when the requested data is not found in the server.
class NotFoundException extends ServerException {
  const NotFoundException({
    required super.message,
  }) : super(statusCode: 404, prefix: 'Not Found:');
}

/// Throw when there is a unexpected network error occured
class RequestTimeOutException extends ServerException {
  const RequestTimeOutException({
    required super.message,
  }) : super(statusCode: 408, prefix: 'Request Time Out');
}
