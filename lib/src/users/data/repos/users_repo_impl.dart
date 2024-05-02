import 'package:dartz/dartz.dart';
import 'package:faisal_starter_code_flutter/core/errors/exceptions.dart';
import 'package:faisal_starter_code_flutter/core/errors/failures.dart';
import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';
import 'package:faisal_starter_code_flutter/src/users/data/datasources/users_remote_data_source.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/repos/users_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: UsersRepo)
class UsersRepoImpl extends UsersRepo {
  const UsersRepoImpl(this._remoteDataSource);

  final UsersRemoteDataSource _remoteDataSource;

  @override
  ResultFuture<List<User>> getUsers() async {
    try {
      final result = await _remoteDataSource.getUsers();
      return Right(result);
    } on ServerException catch (e) {
      return Left(
        ServerFailure.fromException(e),
      );
    } on ClientException catch (e) {
      return Left(
        ClientFailure.fromException(e),
      );
    } on GeneralException catch (e) {
      return Left(
        GeneralFailure.fromException(e),
      );
    }
  }
}
