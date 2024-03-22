import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:faisal_starter_code_flutter/core/errors/failures.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/usecases/get_users.dart';
import 'package:faisal_starter_code_flutter/src/users/presentation/bloc/users_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockGetUsers extends Mock implements GetUsers {}

void main() {
  late GetUsers getUsers;
  late UsersBloc usersBloc;

  setUp(() {
    getUsers = MockGetUsers();
    usersBloc = UsersBloc(
      getUsers: getUsers,
    );
  });

  // arbitrary failure
  const tServerFailure = ServerFailure(
    message: 'Unknown error occured, please try again later',
    statusCode: 505,
  );

  tearDown(() => usersBloc.close());

  test('initial state must be an [UsersInitial]', () {
    expect(usersBloc.state, isA<UsersInitial>());
  });

  group('GetUsersEvent', () {
    blocTest<UsersBloc, UsersState>(
      'should emit [UsersLoading, UsersLoaded] when getUsers succeed',
      build: () {
        when(() => getUsers())
            .thenAnswer((invocation) async => const Right([]));
        return usersBloc;
      },
      act: (bloc) => bloc.add(const GetUsersEvent()),
      expect: () => [
        const UsersLoading(),
        const UsersLoaded(users: []),
      ],
      verify: (bloc) {
        verify(() => getUsers()).called(1);
        verifyNoMoreInteractions(getUsers);
      },
    );

    blocTest<UsersBloc, UsersState>(
      'should emit [UsersLoading, UsersError] when getUsers failed',
      build: () {
        when(() => getUsers())
            .thenAnswer((invocation) async => const Left(tServerFailure));
        return usersBloc;
      },
      act: (bloc) => bloc.add(const GetUsersEvent()),
      expect: () => [
        const UsersLoading(),
        UsersError(message: tServerFailure.errorMessage,),
      ],
      verify: (bloc) {
        verify(() => getUsers()).called(1);
        verifyNoMoreInteractions(getUsers);
      },
    );
  });
}
