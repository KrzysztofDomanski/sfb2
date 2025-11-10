part of 'sign_up_bloc.dart';

abstract class SignUpEvent {
  const SignUpEvent();
}

class ContinueWithDiscordRequested extends SignUpEvent {
  const ContinueWithDiscordRequested();
}
