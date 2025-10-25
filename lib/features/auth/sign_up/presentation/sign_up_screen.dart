import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/core/dependency_injector.dart';
import 'package:sfb/core/widgets/app_logo.dart';
import 'package:sfb/core/widgets/app_title.dart';
import 'package:sfb/features/auth/sign_up/bloc/sign_up_bloc.dart';
import 'package:sfb/features/auth/sign_up/presentation/widgets/already_have_an_account_link.dart';
import 'package:sfb/features/auth/sign_up/presentation/widgets/create_an_account_text.dart';
import 'package:sfb/features/auth/sign_up/presentation/widgets/sign_up_button.dart';
import 'package:sfb/features/auth/sign_up/presentation/widgets/sign_up_email.dart';
import 'package:sfb/features/auth/sign_up/presentation/widgets/sign_up_error.dart';
import 'package:sfb/features/auth/sign_up/presentation/widgets/sign_up_password.dart';

/// The sign-up screen that allows users to create a new account.
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  static const String route = '/sign_up';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignUpBloc>(),
      child: Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 400),
              child: const SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AppLogo(),
                    AppTitle(),
                    SizedBox(height: 64),
                    CreateAnAccountText(),
                    SizedBox(height: 16),
                    SignUpEmail(),
                    SizedBox(height: 16),
                    SignUpPassword(),
                    SizedBox(height: 24),
                    SignUpError(),
                    SignUpButton(),
                    SizedBox(height: 16),
                    Divider(),
                    AlreadyHaveAnAccountLink(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
