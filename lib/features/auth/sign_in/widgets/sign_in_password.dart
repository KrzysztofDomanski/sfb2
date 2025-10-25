import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sfb/features/auth/widgets/password_text_field.dart';

/// A widget that provides a password input field for the sign-in process.
class SignInPassword extends StatelessWidget {
  const SignInPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return PasswordTextField(
          onChanged: (value) =>
              context.read<SignInBloc>().add(PasswordChanged(value)),
          onSubmitted: state.signInEnabled
              ? (_) => context.read<SignInBloc>().add(const SignInRequested())
              : null,
          submitEnabled: state.signInEnabled,
        );
      },
    );
  }
}
