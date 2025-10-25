part of 'sign_up_bloc.dart';

/// Represents the state of the sign-up process.
class SignUpState extends Equatable {
  final String email;
  final String password;
  final bool isSubmitting;
  final bool isSuccess;
  final String? errorMessage;

  const SignUpState({
    this.email = '',
    this.password = '',
    this.isSubmitting = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  bool get signUpEnabled => email.isNotEmpty && password.isNotEmpty;

  SignUpState copyWith({
    String? email,
    String? password,
    bool? isSubmitting,
    bool? isSuccess,
    String? errorMessage,
    bool? resetError,
  }) {
    return SignUpState(
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
