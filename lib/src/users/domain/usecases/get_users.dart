import 'package:faisal_starter_code_flutter/core/usecase/usecase.dart';
import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/repos/users_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUsers extends UseCaseWithoutParams<List<User>> {
  const GetUsers(this._repo);

  final UsersRepo _repo;

  @override
  ResultFuture<List<User>> call() {
    return _repo.getUsers();
  }
}
