import 'package:sfb/core/use_case.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';

class SignOut extends UseCase<void, NoParams> {
  final AuthRepository auth;

  SignOut(this.auth);

  @override
  Future<void> call(NoParams params) {
    return auth.signOut();
  }
}
