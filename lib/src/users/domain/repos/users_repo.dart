import 'package:faisal_starter_code_flutter/core/utils/typedef.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';

abstract class UsersRepo {
  const UsersRepo();

  ResultFuture<List<User>> getUsers();
}
