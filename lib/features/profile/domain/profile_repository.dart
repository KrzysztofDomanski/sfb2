import 'package:sfb/features/profile/domain/profile.dart';

/// Abstract repository for managing user profiles.
abstract class ProfileRepository {
  /// Fetches the profile for a given user ID.
  Future<Profile?> fetchProfile(String userId);

  /// Updates the profile with new data.
  Future<void> updateProfile(Profile profile);
}
