import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:sfb/features/auth/widgets/password_text_field.dart';

/// A widget that provides a password input field for the sign-up process.
class SignUpPassword extends StatelessWidget {
  const SignUpPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return PasswordTextField(
          onChanged: (value) =>
              context.read<SignUpBloc>().add(PasswordChanged(value)),
          onSubmitted: state.signUpEnabled
              ? (_) => context.read<SignUpBloc>().add(const SignUpRequested())
              : null,
          submitEnabled: state.signUpEnabled,
        );
      },
    );
  }
}
