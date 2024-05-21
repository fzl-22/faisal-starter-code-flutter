part of 'users_bloc.dart';

@freezed
sealed class UsersEvent with _$UsersEvent {
  const factory UsersEvent.getUsers() = GetUsersEvent;
}
