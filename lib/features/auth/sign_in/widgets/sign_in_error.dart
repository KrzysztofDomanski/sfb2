import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sfb/features/auth/widgets/text_error.dart';

/// A widget that displays sign-in error messages.
class SignInError extends StatelessWidget {
  const SignInError({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignInBloc, SignInState>(
      builder: (context, state) {
        return TextError(errorMessage: state.errorMessage);
      },
    );
  }
}
