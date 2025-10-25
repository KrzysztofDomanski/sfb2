part of 'auth_bloc.dart';

class AuthEvent {
  const AuthEvent();
}

class AuthUserChanged extends AuthEvent {
  final User? user;
  const AuthUserChanged(this.user);
}
