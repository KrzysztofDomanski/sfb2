import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:sfb/features/auth/widgets/email_text_field.dart';

/// A widget that provides an email input field for the sign-up process.
class SignUpEmail extends StatelessWidget {
  const SignUpEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return EmailTextField(
          onChanged: (value) =>
              context.read<SignUpBloc>().add(EmailChanged(value)),
          onSubmitted: state.signUpEnabled
              ? (_) => context.read<SignUpBloc>().add(const SignUpRequested())
              : null,
          submitEnabled: state.signUpEnabled,
        );
      },
    );
  }
}
