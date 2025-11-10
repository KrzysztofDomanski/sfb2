import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sfb/features/auth/presentation/auth_screen.dart';
import 'package:sfb/features/home/home_screen.dart';
import 'package:sfb/features/profile/presentation/profile_screen.dart';

extension NavExtension on BuildContext {
  void goToSignUp() => goNamed(SignUpScreen.route);

  void goToProfile() => goNamed(ProfileScreen.route);

  void goToHome() => goNamed(HomeScreen.route);
}
