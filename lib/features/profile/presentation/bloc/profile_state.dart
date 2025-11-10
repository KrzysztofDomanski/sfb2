part of 'profile_bloc.dart';

class ProfileState extends Equatable {
  final bool isLoading;
  final Profile? profile;
  final String? errorMessage;

  const ProfileState({
    this.isLoading = false,
    this.profile,
    this.errorMessage,
  });

  ProfileState copyWith({
    bool? isLoading,
    Profile? profile,
    String? errorMessage,
  }) {
    return ProfileState(
      isLoading: isLoading ?? this.isLoading,
      profile: profile ?? this.profile,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [isLoading, profile, errorMessage];
}
