import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/features/auth/domain/auth_exceptions.dart';
import 'package:sfb/features/auth/domain/sign_up.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

/// Bloc responsible for handling sign-up events and managing sign-up state.
@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final SignUp _signUp;

  SignUpBloc(SignUp signUp) : _signUp = signUp, super(const SignUpState()) {
    on<EmailChanged>(_onEmailChanged);
    on<PasswordChanged>(_onPasswordChanged);
    on<SignUpRequested>(_onSignUpRequested);
  }

  void _onEmailChanged(
    EmailChanged event,
    Emitter<SignUpState> emit,
  ) {
    Log.t('Email changed: ${event.email}');

    emit(state.copyWith(email: event.email, resetError: true));
  }

  void _onPasswordChanged(
    PasswordChanged event,
    Emitter<SignUpState> emit,
  ) {
    Log.t('Password changed: ${event.password}');

    emit(state.copyWith(password: event.password, resetError: true));
  }

  Future<void> _onSignUpRequested(
    SignUpRequested event,
    Emitter<SignUpState> emit,
  ) async {
    Log.t('SignUp requested for email: ${state.email}');

    emit(state.copyWith(isSubmitting: true));

    try {
      await _signUp(SignUpParams(email: state.email, password: state.password));
      Log.t('SignUp successful for email: ${state.email}');
      emit(state.copyWith(isSubmitting: false, isSuccess: true));
    } on SignUpFailedException catch (e) {
      Log.e('SignUp failed', e);
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      Log.e('SignUp failed', e);
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: 'An unexpected error occurred during sign up.',
        ),
      );
    }
  }
}
