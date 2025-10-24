import 'package:injectable/injectable.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';
import 'package:sfb/features/auth/domain/user.dart';

@singleton
class AuthRepositoryImpl extends AuthRepository {
  @override
  Stream<User?> get currentUser => throw UnimplementedError();

  @override
  Future<void> signIn(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
