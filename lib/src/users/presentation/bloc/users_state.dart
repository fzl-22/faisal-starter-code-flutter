part of 'users_bloc.dart';

@freezed
sealed class UsersState with _$UsersState {
  const factory UsersState.usersInitial() = UsersInitial;

  const factory UsersState.gettingUsers() = GettingUsers;

  const factory UsersState.usersLoaded({
    required List<User> users,
  }) = UsersLoaded;

  const factory UsersState.getUsersError({
    required String message,
  }) = GetUsersError;
}
