import 'package:injectable/injectable.dart';
import 'package:sfb/features/auth/domain/auth_exceptions.dart' hide AuthException;
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
  Future<void> signUp(String username, String password) async {
    try {
      await _auth.signUp(email: username, password: password);
    } on AuthException catch (e) {
      throw SignUpFailedException(e.message);
    } catch (e) {
      throw Exception('An unexpected error occurred during sign up.');
    }
  }

  @override
  Future<void> signIn(String username, String password) async {
    try {
      await _auth.signInWithPassword(email: username, password: password);
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('An unexpected error occurred during sign in.');
    }
  }

  @override
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on AuthException catch (e) {
      throw Exception(e.message);
    } catch (e) {
      throw Exception('An unexpected error occurred during sign out.');
    }
  }
}
