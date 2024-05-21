import 'package:bloc/bloc.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/usecases/get_users.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'users_event.dart';
part 'users_state.dart';
part 'users_bloc.freezed.dart';

@injectable
class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({
    required GetUsers getUsers,
  })  : _getUsers = getUsers,
        super(const UsersInitial()) {
    on<GetUsersEvent>(_getUsersHandler);
  }

  final GetUsers _getUsers;

  Future<void> _getUsersHandler(
    GetUsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    emit(const UsersState.gettingUsers());

    final result = await _getUsers();

    if (isClosed) return;

    result.fold(
      (failure) => emit(GetUsersError(message: failure.errorMessage)),
      (users) => emit(UsersLoaded(users: users)),
    );
  }
}
