import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';
import 'package:sfb/features/auth/domain/user.dart';

part 'auth_event.dart';
part 'auth_state.dart';

@singleton
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  StreamSubscription<User?>? _userSubscription;

  AuthBloc(AuthRepository auth) : super(const AuthState.initial()) {
    Log.t('AuthBloc initialized');

    on<AuthUserChanged>(_onAuthUserChanged);

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

  @override
  Future<void> close() async {
    Log.t('AuthBloc closed');
    await _userSubscription?.cancel();
    return super.close();
  }
}
