import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/features/profile/domain/profile.dart';
import 'package:sfb/features/profile/domain/profile_repository.dart';

part 'profile_event.dart';
part 'profile_state.dart';

@injectable
class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ProfileRepository _profileRepository;

  ProfileBloc(ProfileRepository profileRepository)
    : _profileRepository = profileRepository,
      super(const ProfileState()) {
    on<LoadProfile>(_onLoadProfile);
    on<UpdateFirstName>(_onFirstNameChanged);
    on<UpdateLastName>(_onLastNameChanged);
  }

  Future<void> _onLoadProfile(
    LoadProfile event,
    Emitter<ProfileState> emit,
  ) async {
    emit(state.copyWith(isLoading: true));
    Log.t('Loading profile for userId: ${event.userId}');
    // Simulate fetching profile
    // ignore: inference_failure_on_instance_creation
    await Future.delayed(const Duration(seconds: 1));
    try {
      final profile = await _profileRepository.fetchProfile(event.userId);
      emit(state.copyWith(profile: profile, isLoading: false));
      Log.t('Profile loaded: $profile');
    } catch (e) {
      Log.e('Failed to load profile: $e');
    }
  }

  void _onFirstNameChanged(
    UpdateFirstName event,
    Emitter<ProfileState> emit,
  ) {
    Log.t('First name changed: ${event.firstName}');
    emit(
      state.copyWith(
        profile: state.profile?.copyWith(firstName: event.firstName),
      ),
    );
  }

  void _onLastNameChanged(
    UpdateLastName event,
    Emitter<ProfileState> emit,
  ) {
    Log.t('Last name changed: ${event.lastName}');
    emit(
      state.copyWith(
        profile: state.profile?.copyWith(lastName: event.lastName),
      ),
    );
  }
}
