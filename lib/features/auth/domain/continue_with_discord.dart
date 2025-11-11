import 'package:injectable/injectable.dart';
import 'package:sfb/core/use_case.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';

@injectable
class ContinueWithDiscord extends UseCase<void, NoParams> {
  final AuthRepository authRepository;

  ContinueWithDiscord(this.authRepository);

  @override
  Future<void> call(NoParams params) {
    return authRepository.continueWithDiscord();
  }
}
