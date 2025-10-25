import 'package:injectable/injectable.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';
import 'package:sfb/features/auth/domain/user.dart' as domain;
import 'package:supabase_flutter/supabase_flutter.dart';

@Singleton(as: AuthRepository)
class AuthRepositoryImpl extends AuthRepository {
  final GoTrueClient _auth;

  AuthRepositoryImpl(SupabaseClient supabaseClient)
    : _auth = supabaseClient.auth;

  @override
  Stream<domain.User?> get currentUser => _auth.onAuthStateChange
      .map((event) => event.session?.user)
      .map(
        (user) => user == null
            ? null
            : domain.User(id: user.id, email: user.email ?? ''),
      );

  @override
  Future<void> signIn(String username, String password) {
    throw UnimplementedError();
  }

  @override
  Future<void> signOut() {
    throw UnimplementedError();
  }
}
