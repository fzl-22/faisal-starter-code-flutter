part of 'users_bloc.dart';

sealed class UsersState extends Equatable {
  const UsersState();

  @override
  List<Object> get props => [];
}

final class UsersInitial extends UsersState {
  const UsersInitial();
}

final class UsersLoading extends UsersState {
  const UsersLoading();
}

final class UsersLoaded extends UsersState {
  const UsersLoaded({
    required this.users,
  });

  final List<User> users;

  @override
  List<Object> get props => [users];
}

final class UsersError extends UsersState {
  const UsersError({
    required this.message,
  });

  final String message;

  @override
  List<String> get props => [message];
}
