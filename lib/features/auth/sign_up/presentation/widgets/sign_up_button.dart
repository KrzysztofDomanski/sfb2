import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/core/locale/app_locale_extension.dart';
import 'package:sfb/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:sfb/features/auth/widgets/elevated_button_with_progress.dart';

/// A widget that provides a sign-up button for the sign-up process.
class SignUpButton extends StatelessWidget {
  const SignUpButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return ElevatedButtonWithProgress(
          isEnabled: state.signUpEnabled,
          isSubmitting: state.isSubmitting,
          onPressed: () =>
              context.read<SignUpBloc>().add(const SignUpRequested()),
          buttonText: context.loc.signUp,
        );
      },
    );
  }
}
