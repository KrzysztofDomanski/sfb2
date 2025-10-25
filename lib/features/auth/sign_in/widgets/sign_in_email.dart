import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sfb/features/auth/widgets/email_text_field.dart';

/// A widget that provides an email input field for the sign-in process.
class SignInEmail extends StatelessWidget {
  const SignInEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return EmailTextField(
          onChanged: (value) =>
              context.read<SignInBloc>().add(EmailChanged(value)),
          onSubmitted: state.signInEnabled
              ? (_) => context.read<SignInBloc>().add(const SignInRequested())
              : null,
          submitEnabled: state.signInEnabled,
        );
      },
    );
  }
}
