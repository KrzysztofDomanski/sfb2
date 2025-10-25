import 'package:flutter/widgets.dart';
import 'package:sfb/core/theme/theme_extensions.dart';

/// A widget that displays the sign-in text.
class SignInText extends StatelessWidget {
  const SignInText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sign in to your account',
        style: context.textTheme.headlineSmall,
      ),
    );
  }
}
