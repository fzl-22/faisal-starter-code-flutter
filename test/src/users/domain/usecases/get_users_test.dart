import 'package:dartz/dartz.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/repos/users_repo.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/usecases/get_users.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../repos/users_repo.mock.dart';

void main() {
  late UsersRepo repo;
  late GetUsers usecase;

  setUp(() {
    repo = MockUsersRepo();
    usecase = GetUsers(repo);
  });

  test(
    'should call successfully from the [UsersRepo]',
    () async {
      when(() => repo.getUsers()).thenAnswer(
        (invocation) async => const Right([]),
      );

      final result = await usecase();

      expect(result, const Right<dynamic, List<User>>([]));

      verify(() => repo.getUsers()).called(1);
      verifyNoMoreInteractions(repo);
    },
  );
}
