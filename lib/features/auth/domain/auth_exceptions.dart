/// Defines exceptions related to authentication processes.
abstract class AuthException implements Exception {
  final String message;

  AuthException(this.message);

  @override
  String toString() => message;
}

/// Exception thrown when sign-up fails.
class SignUpFailedException extends AuthException {
  SignUpFailedException(super.message);
}

/// Exception thrown when sign-in fails.
class SignInFailedException extends AuthException {
  SignInFailedException(super.message);
}
