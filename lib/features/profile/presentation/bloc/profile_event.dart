part of 'profile_bloc.dart';

abstract class ProfileEvent {
  const ProfileEvent();
}

class LoadProfile extends ProfileEvent {
  final String userId;

  const LoadProfile(this.userId);
}

class UpdateFirstName extends ProfileEvent {
  final String firstName;

  const UpdateFirstName(this.firstName);
}

class UpdateLastName extends ProfileEvent {
  final String lastName;

  const UpdateLastName(this.lastName);
}
