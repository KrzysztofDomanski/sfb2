import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/use_case.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';

/// Use case for signing up a new user.
@injectable
class SignUp extends UseCase<void, SignUpParams> {
  final AuthRepository authRepository;

  SignUp(this.authRepository);

  @override
  Future<void> call(SignUpParams params) async {
    await authRepository.signUp(params.email, params.password);
  }
}

/// Parameters required for signing up a new user.
final class SignUpParams extends Equatable {
  final String email;
  final String password;

  const SignUpParams({required this.email, required this.password});

  @override
  List<Object?> get props => [email, password];
}
