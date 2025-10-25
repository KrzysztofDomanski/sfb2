part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class SignUpRequested extends SignUpEvent {
  const SignUpRequested();
}

class EmailChanged extends SignUpEvent {
  final String email;

  const EmailChanged(this.email);
}

class PasswordChanged extends SignUpEvent {
  final String password;

  const PasswordChanged(this.password);
}
