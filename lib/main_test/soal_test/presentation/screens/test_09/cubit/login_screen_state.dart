part of 'login_screen_cubit.dart';

sealed class LoginScreenState extends Equatable {
  const LoginScreenState();

  @override
  List<Object> get props => [];
}

final class LoginScreenInitial extends LoginScreenState {}

final class LoginScreenLoading extends LoginScreenState {}

final class LoginScreenSuccess extends LoginScreenState {
  final String username;
  const LoginScreenSuccess({required this.username});
  @override
  List<Object> get props => [username];
}

final class LoginScreenError extends LoginScreenState {
  final String message;
  const LoginScreenError({required this.message});
  @override
  List<Object> get props => [message];
}
