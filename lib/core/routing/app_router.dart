import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/core/routing/router_refresh.dart';
import 'package:sfb/features/auth/bloc/auth_bloc.dart';
import 'package:sfb/features/auth/presentation/auth_screen.dart';
import 'package:sfb/features/home/home_screen.dart';
import 'package:sfb/features/profile/presentation/profile_screen.dart';

/// A helper function to create a page with a fade transition.
/// This function is used to provide a consistent fade transition
/// between different screens in the app.
Page<dynamic> fadeTransitionPageBuilder(
  BuildContext context,
  GoRouterState state,
  Widget child,
) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(
          curve: Curves.easeInOutCirc,
        ).animate(animation),
        child: child,
      );
    },
  );
}

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
        name: ProfileScreen.route,
        path: ProfileScreen.route,
        pageBuilder: (context, state) {
          return fadeTransitionPageBuilder(
            context,
            state,
            const ProfileScreen(),
          );
        },
      ),
      GoRoute(
        name: HomeScreen.route,
        path: HomeScreen.route,
        pageBuilder: (context, state) {
          return fadeTransitionPageBuilder(
            context,
            state,
            const HomeScreen(),
          );
        },
      ),
      GoRoute(
        name: SignUpScreen.route,
        path: SignUpScreen.route,
        pageBuilder: (context, state) {
          return fadeTransitionPageBuilder(
            context,
            state,
            const SignUpScreen(),
          );
        },
        // builder: (context, state) => const SignUpScreen(),
      ),
    ],
  );

  FutureOr<String?> _redirect(BuildContext context, GoRouterState state) {
    final isLoggedIn = _authBloc.state.user != null;
    final isLoggingIn = state.matchedLocation == SignUpScreen.route;

    if (!isLoggedIn && !isLoggingIn) {
      Log.t('Redirecting to SignUpScreen');
      return SignUpScreen.route;
    }

    if (isLoggedIn && isLoggingIn) {
      Log.t('Redirecting to ProfileScreen');
      return ProfileScreen.route;
    }

    return null;
  }
}
