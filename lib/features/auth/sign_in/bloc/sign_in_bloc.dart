import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/features/auth/domain/auth_exceptions.dart';
import 'package:sfb/features/auth/domain/sign_in.dart';

part 'sign_in_event.dart';
part 'sign_in_state.dart';

/// Bloc responsible for handling sign-in events and managing sign-in state.
@injectable
class SignInBloc extends Bloc<SignInEvent, SignInState> {
  final SignIn _signIn;

  SignInBloc(SignIn signIn) : _signIn = signIn, super(const SignInState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignInRequested>(_onSignInRequested);
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<SignInState> emit,
  ) {
    Log.t('Email changed: ${event.email}');

    emit(state.copyWith(email: event.email, resetError: true));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignInState> emit,
  ) {
    Log.t('Password changed: ${event.password}');

    emit(state.copyWith(password: event.password, resetError: true));
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<SignInState> emit,
  ) async {
    Log.t('SignIn requested for email: ${state.email}');

    emit(state.copyWith(isSubmitting: true));

    try {
      await _signIn(SignInParams(email: state.email, password: state.password));
      Log.t('SignIn successful for email: ${state.email}');
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } on SignInFailedException catch (e) {
      Log.e('SignIn failed', e);
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      Log.e('SignIn failed', e);
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: 'An unexpected error occurred during sign in.',
        ),
      );
    }
  }
}
