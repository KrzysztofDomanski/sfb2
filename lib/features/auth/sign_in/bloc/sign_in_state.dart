part of 'sign_in_bloc.dart';

/// Represents the state of the sign-in process.
class SignInState extends Equatable {
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const SignInState({
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  bool get signInEnabled => email.isNotEmpty && password.isNotEmpty;

  SignInState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
    bool? resetError,
  }) {
    return SignInState(
      email: email ?? this.email,
      password: password ?? this.password,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      isSuccess: isSuccess ?? this.isSuccess,
      errorMessage: resetError ?? false
          ? null
          : errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [
    email,
    password,
    isSubmitting,
    isSuccess,
    errorMessage,
  ];
}
