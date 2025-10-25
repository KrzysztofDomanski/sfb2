import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:sfb/features/auth/widgets/text_error.dart';

/// A widget that displays sign-up error messages.
class SignUpError extends StatelessWidget {
  const SignUpError({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SignUpBloc, SignUpState>(
      builder: (context, state) {
        return TextError(errorMessage: state.errorMessage);
      },
    );
  }
}
