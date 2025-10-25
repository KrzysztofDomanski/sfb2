import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:sfb/features/auth/sign_in/presentation/sign_in_screen.dart';
import 'package:sfb/features/auth/sign_up/presentation/sign_up_screen.dart';

extension NavExtension on BuildContext {
  void goToSignIn() => goNamed(SignInScreen.route);

  void goToSignUp() => goNamed(SignUpScreen.route);
}
