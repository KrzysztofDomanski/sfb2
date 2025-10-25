import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:sfb/core/locale/app_locale_extension.dart';
import 'package:sfb/core/routing/nav_extension.dart';
import 'package:sfb/core/theme/theme_extensions.dart';

/// A widget that displays a link for users who already have an account.
class AlreadyHaveAnAccountLink extends StatelessWidget {
  const AlreadyHaveAnAccountLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '${context.loc.alreadyHaveAnAccount} ',
            style: context.textTheme.bodyMedium,
          ),
          TextSpan(
            text: context.loc.signIn,
            style: context.textTheme.bodyMedium?.copyWith(
              color: Colors.lightBlue,
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () => context.goToSignIn(),
          ),
        ],
      ),
    );
  }
}
