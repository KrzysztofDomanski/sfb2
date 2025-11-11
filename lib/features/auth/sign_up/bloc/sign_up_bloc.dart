import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:sfb/core/logger.dart';
import 'package:sfb/core/use_case.dart';
import 'package:sfb/features/auth/domain/auth_exceptions.dart';
import 'package:sfb/features/auth/domain/continue_with_discord.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

/// Bloc responsible for handling sign-up events and managing sign-up state.
@injectable
class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final ContinueWithDiscord _continueWithDiscord;

  SignUpBloc(ContinueWithDiscord continueWithDiscord)
    : _continueWithDiscord = continueWithDiscord,
      super(const SignUpState()) {
    on<ContinueWithDiscordRequested>(_onContinueWithDiscord);
  }

  Future<void> _onContinueWithDiscord(
    ContinueWithDiscordRequested event,
    Emitter<SignUpState> emit,
  ) async {
    Log.t('Continue with Discord requested');
    emit(state.copyWith(isSubmitting: true));

    // Implementation for Discord sign-up would go here.
    // For now, we just log the event.
    try {
      await _continueWithDiscord(const NoParams());
      Log.t('Continue with Discord initiated');
    } on SignInFailedException catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: e.message,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isSubmitting: false,
          isSuccess: false,
          errorMessage: 'An unexpected error occurred during Discord sign in.',
        ),
      );
    }
  }
}
