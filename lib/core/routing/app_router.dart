import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/core/routing/router_refresh.dart';
import 'package:sfb/features/auth/bloc/auth_bloc.dart';
import 'package:sfb/features/auth/presentation/auth_screen.dart';
import 'package:sfb/features/home/home_screen.dart';

/// AppRouter sets up the routing for the application using GoRouter.
class AppRouter {
  /// The AuthBloc instance to manage authentication state.
  final AuthBloc _authBloc;

  AppRouter(AuthBloc authBloc) : _authBloc = authBloc;

  GoRouter get router => GoRouter(
    refreshListenable: RouterRefresh(_authBloc.stream),
    redirect: _redirect,
    routes: [
      GoRoute(
        name: HomeScreen.route,
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        name: AuthScreen.route,
        path: AuthScreen.route,
        builder: (context, state) => const AuthScreen(),
      ),
    ],
  );

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
    final isLoggedIn = _authBloc.state.user != null;
    final isLoggingIn = state.matchedLocation == AuthScreen.route;

    if (!isLoggedIn && !isLoggingIn) {
      Log.t('Redirecting to AuthScreen');
      return AuthScreen.route;
    }

    if (isLoggedIn && isLoggingIn) {
      Log.t('Redirecting to HomeScreen');
      return HomeScreen.route;
    }

    return null;
  }
}
