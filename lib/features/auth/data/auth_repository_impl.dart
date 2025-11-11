import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/features/auth/domain/auth_exceptions.dart'
    hide AuthException;
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
  Future<void> continueWithDiscord() async {
    try {
      await _auth.signInWithOAuth(
        OAuthProvider.discord,
        redirectTo: kIsWeb ? null : 'com.kd.sfb://login-callback/',
      );
    } on AuthException catch (e) {
      throw SignInFailedException(e.message);
    } catch (e) {
      throw Exception('An unexpected error occurred during Discord sign in.');
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
