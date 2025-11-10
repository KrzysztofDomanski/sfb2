import 'package:injectable/injectable.dart';
import 'package:sfb/features/profile/domain/profile.dart';
import 'package:sfb/features/profile/domain/profile_repository.dart';

@Singleton(as: ProfileRepository)
class FakeProfileRepositoryImpl extends ProfileRepository {
  // Fake profile
  Profile _fakeProfile = const Profile(
    id: 'fake-id',
    firstName: 'firstName',
    lastName: 'lastName',
  );

  @override
  Future<Profile?> fetchProfile(String userId) {
    return Future.value(_fakeProfile);
  }

  @override
  Future<void> updateProfile(Profile profile) {
    _fakeProfile = profile;
    return Future.value();
  }
}
