import 'package:sfb/features/auth/domain/user.dart';

/// An abstract repository for authentication-related operations.
abstract class AuthRepository {
  /// A stream that emits the current authenticated user, or null if not authenticated.
  Stream<User?> get currentUser;

  /// Signs in a user using Discord OAuth.
  Future<void> continueWithDiscord();

  /// Signs out the current user.
  Future<void> signOut();
}
