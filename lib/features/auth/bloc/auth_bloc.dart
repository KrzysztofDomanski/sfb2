import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/core/use_case.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';
import 'package:sfb/features/auth/domain/sign_in.dart';
import 'package:sfb/features/auth/domain/sign_out.dart';
import 'package:sfb/features/auth/domain/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final SignIn _signIn;
  final SignOut _signOut;
  StreamSubscription<User?>? _userSubscription;

  AuthBloc(AuthRepository auth, SignIn signIn, SignOut signOut)
    : _signIn = signIn,
      _signOut = signOut,
      super(const AuthState.initial()) {
    Log.t('AuthBloc initialized');

    on<AuthUserChanged>(_onAuthUserChanged);
    on<SignInRequested>(_onSignInRequested);
    on<SignOutRequested>(_onSignOutRequested);

    _userSubscription = auth.currentUser.listen((user) {
      add(AuthUserChanged(user));
    });
  }

  Future<void> _onAuthUserChanged(
    AuthUserChanged event,
    Emitter<AuthState> emit,
  ) async {
    Log.t('Auth user changed: ${event.user}');
    emit(AuthState(user: event.user));
  }

  Future<void> _onSignInRequested(
    SignInRequested event,
    Emitter<AuthState> emit,
  ) async {
    Log.t('SignIn requested for email: ${event.email}');

    try {
      await _signIn(SignInParams(email: event.email, password: event.password));
      Log.t('SignIn successful for email: ${event.email}');
    } catch (e) {
      Log.e('SignIn failed', e);
    }
  }

  Future<void> _onSignOutRequested(
    SignOutRequested event,
    Emitter<AuthState> emit,
  ) async {
    Log.t('SignOut requested');

    try {
      await _signOut(NoParams());
      Log.t('SignOut successful');
    } catch (e) {
      Log.e('SignOut failed', e);
    }
  }

  @override
  Future<void> close() {
    Log.t('AuthBloc closed');
    _userSubscription?.cancel();
    return super.close();
  }
}
