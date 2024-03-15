import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/entities/user.dart';
import 'package:faisal_starter_code_flutter/src/users/domain/usecases/get_users.dart';

part 'users_event.dart';
part 'users_state.dart';

class UsersBloc extends Bloc<UsersEvent, UsersState> {
  UsersBloc({
    required GetUsers getUsers,
  })  : _getUsers = getUsers,
        super(const UsersInitial()) {
    on<UsersEvent>((event, emit) {
      emit(const UsersLoading());
    });

    on<GetUsersEvent>(_getUsersHandler);
  }

  final GetUsers _getUsers;

  Future<void> _getUsersHandler(
    UsersEvent event,
    Emitter<UsersState> emit,
  ) async {
    final result = await _getUsers();

    result.fold(
      (failure) => emit(UsersError(message: failure.errorMessage)),
      (users) => emit(UsersLoaded(users: users)),
    );
  }
}
