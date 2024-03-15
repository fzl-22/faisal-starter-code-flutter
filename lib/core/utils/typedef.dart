import 'package:dartz/dartz.dart';
import 'package:faisal_starter_code_flutter/core/errors/failures.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef DataMap = Map<String, dynamic>;
