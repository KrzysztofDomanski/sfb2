import 'package:flutter/widgets.dart';
import 'package:sfb/core/theme/theme_extensions.dart';

/// A widget that displays the "Create your account" text.
class CreateAnAccountText extends StatelessWidget {
  const CreateAnAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        'Sign up or log in using your Discord account to continue',
        style: context.textTheme.titleMedium,
      ),
    );
  }
}
