import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sfb/core/dependency_injector.dart';
import 'package:sfb/core/widgets/app_logo.dart';
import 'package:sfb/core/widgets/app_title.dart';
import 'package:sfb/features/auth/sign_in/bloc/sign_in_bloc.dart';
import 'package:sfb/features/auth/sign_in/widgets/no_account_link.dart';
import 'package:sfb/features/auth/sign_in/widgets/sign_in_button.dart';
import 'package:sfb/features/auth/sign_in/widgets/sign_in_email.dart';
import 'package:sfb/features/auth/sign_in/widgets/sign_in_error.dart';
import 'package:sfb/features/auth/sign_in/widgets/sign_in_password.dart';
import 'package:sfb/features/auth/sign_in/widgets/sign_in_text.dart';

/// The sign-in screen that allows users to log into their account.
class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  static const String route = '/sign_in';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SignInBloc>(),
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
                    SignInText(),
                    SizedBox(height: 16),
                    SignInEmail(),
                    SizedBox(height: 16),
                    SignInPassword(),
                    SizedBox(height: 24),
                    SignInError(),
                    SignInButton(),
                    SizedBox(height: 16),
                    Divider(),
                    NoAccountLink(),
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
