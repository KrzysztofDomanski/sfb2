import 'package:sfb/features/auth/domain/user.dart';

/// An abstract repository for authentication-related operations.
abstract class AuthRepository {
  /// A stream that emits the current authenticated user, or null if not authenticated.
  Stream<User?> get currentUser;

  /// Signs up a new user with the given [username] and [password].
  Future<void> signUp(String username, String password);

  /// Signs in a user with the given [username] and [password].
  Future<void> signIn(String username, String password);

  /// Signs out the current user.
  Future<void> signOut();
}
