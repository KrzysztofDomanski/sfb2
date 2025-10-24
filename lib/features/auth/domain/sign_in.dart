import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/use_case.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';

@injectable
class SignIn extends UseCase<void, SignInParams> {
  final AuthRepository auth;

  SignIn(this.auth);

  @override
  Future<void> call(SignInParams params) {
    return auth.signIn(params.email, params.password);
  }
}

class SignInParams extends Equatable {
  final String email;
  final String password;

  const SignInParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
