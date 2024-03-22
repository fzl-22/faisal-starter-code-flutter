import 'package:dartz/dartz.dart';
import 'package:faisal_starter_code_flutter/core/errors/exceptions.dart';
import 'package:faisal_starter_code_flutter/core/errors/failures.dart';
import 'package:faisal_starter_code_flutter/src/users/data/datasources/users_remote_data_source.dart';
import 'package:faisal_starter_code_flutter/src/users/data/models/user_model.dart';
import 'package:faisal_starter_code_flutter/src/users/data/repos/users_repo_impl.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/repos/users_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockUsersRemoteDataSource extends Mock implements UsersRemoteDataSource {}

void main() {
  late UsersRemoteDataSource remoteDataSource;
  late UsersRepoImpl repoImpl;

  setUp(() {
    remoteDataSource = MockUsersRemoteDataSource();
    repoImpl = UsersRepoImpl(remoteDataSource);
  });

  const tServerException = ServerException(
    statusCode: 404,
    message: 'Not Found',
  );

  const tClientException = ClientException(
    message: 'A client error occurred',
  );

  const tGeneralException = GeneralException(
    message: 'A general error occured',
  );

  test('should be a subclass of [UsersRepo]', () {
    expect(repoImpl, isA<UsersRepo>());
  });

  group('getUsers', () {
    test(
      'should return [List<UserModel>] when call to remote data '
      'source is successful',
      () async {
        when(() => remoteDataSource.getUsers())
            .thenAnswer((invocation) async => <UserModel>[]);

        final result = await repoImpl.getUsers();

        expect(result, isA<Right<dynamic, List<User>>>());

        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return a [ServerFailure] if any server related error occured',
      () async {
        when(() => remoteDataSource.getUsers()).thenThrow(tServerException);

        final result = await repoImpl.getUsers();

        expect(
          result,
          Left<Failure, List<UserModel>>(
            ServerFailure.fromException(tServerException),
          ),
        );

        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return a [ClientFailure] if any client related error occured',
      () async {
        when(() => remoteDataSource.getUsers()).thenThrow(tClientException);

        final result = await repoImpl.getUsers();

        expect(
          result,
          Left<Failure, List<UserModel>>(
            ClientFailure.fromException(tClientException),
          ),
        );

        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );

    test(
      'should return a [GeneralFailure] if any general error occured',
      () async {
        when(() => remoteDataSource.getUsers()).thenThrow(tGeneralException);

        final result = await repoImpl.getUsers();

        expect(
          result,
          Left<Failure, List<UserModel>>(
            GeneralFailure.fromException(tGeneralException),
          ),
        );

        verify(() => remoteDataSource.getUsers()).called(1);
        verifyNoMoreInteractions(remoteDataSource);
      },
    );
  });
}
