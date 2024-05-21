///
/// Classes that encapsulate the business logic of the application.
/// It performs specific tasks or operations and are designed to be reusable
/// and independent of the UI or external frameworks.
///
library;

import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';

/// [UseCaseWithParams]
///
/// Abstract class for use cases that require parameters for execution.
/// Implementations should override the `call` method,
/// which takes parameters of type [Params] and returns a
/// [ResultFuture] of type [T].
///
/// Example:
/// ```dart
/// class SampleUseCase extends UseCaseWithParams<String, SampleParams> {
///   const SampleUseCase(this._repo);
///
///   final SampleRepo _repo;
///
///   @override
///   ResultFuture<String> call(SampleParams params) {
///     // Implement business logic here
///     return _repo.sampleMethod(
///       params1: params.params1,
///       params2: params.params2,
///     ),
///   }
/// }
///
/// class SampleParams extends Equatable {
///    const SampleParams({
///     required this.params1,
///     required this.params2,
///   });
///
///   final String params1;
///   final String params2;
///
///   @override
///   List<Object?> props => [params1, params2];
/// }
/// ```
abstract class UseCaseWithParams<T, Params> {
  const UseCaseWithParams();

  /// Executes the use case with the provided parameters.
  ///
  /// The [params] argument represents the parameters required for the use case.
  /// Returns a [ResultFuture] containing the result of the use case operation.
  ResultFuture<T> call(Params params);
}

/// [UseCaseWithoutParams]
///
/// Abstract class for use cases that do not require any parameters
/// for execution. Implementations should override the `call` method,
/// which takes no parameters and returns a [ResultFuture] of type [T].
///
/// Example:
/// ```dart
/// class SampleUseCase extends UseCaseWithoutParams<String> {
///   const SampleUseCase(this._repo);
///
///   final SampleRepo _repo;
///
///   @override
///   ResultFuture<String> call() {
///     // Implement business logic here
///     return _repo.sampleMethod();
///   }
/// }
/// ```
abstract class UseCaseWithoutParams<T> {
  /// Constructs a new instance of the [UseCaseWithoutParams] class.
  const UseCaseWithoutParams();

  /// Executes the use case without any parameters.
  ///
  /// Returns a [ResultFuture] containing the result of the use case operation.
  ResultFuture<T> call();
}

/// [UseCaseStreamWithParams]
///
/// [Stream] version of [UseCaseStreamWithParams].
abstract class UseCaseStreamWithParams<T, Params> {
  const UseCaseStreamWithParams();

  /// Executes the use case with the provided parameters.
  ///
  /// The [params] argument represents the parameters required for the use case.
  /// Returns a [ResultStream] containing the result of the use case operation.
  ResultStream<T> call(Params params);
}

/// [UseCaseStreamWithoutParams]
///
/// [Stream] version of [UseCaseStreamWithoutParams].
abstract class UseCaseStreamWithoutParams<T> {
  /// Constructs a new instance of the [UseCaseStreamWithoutParams] class.
  const UseCaseStreamWithoutParams();

  /// Executes the use case without any parameters.
  ///
  /// Returns a [ResultStream] containing the result of the use case operation.
  ResultStream<T> call();
}
