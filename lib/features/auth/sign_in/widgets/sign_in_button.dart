import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/core/locale/app_locale_extension.dart';
import 'package:sfb/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sfb/features/auth/widgets/elevated_button_with_progress.dart';

/// A widget that provides a sign-in button for the sign-in process.
class SignInButton extends StatelessWidget {
  const SignInButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return ElevatedButtonWithProgress(
          isEnabled: state.signInEnabled,
          isSubmitting: state.isSubmitting,
          onPressed: () =>
              context.read<SignInBloc>().add(const SignInRequested()),
          buttonText: context.loc.signIn,
        );
      },
    );
  }
}
