import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sfb/features/auth/bloc/auth_bloc.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';
import 'package:sfb/features/auth/domain/user.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAuthRepository authRepository;
    late StreamController<User?> currentUserController;

    setUp(() {
      authRepository = MockAuthRepository();
      currentUserController = StreamController<User?>();
      when(
        authRepository.currentUser,
      ).thenAnswer((_) => currentUserController.stream);
      authBloc = AuthBloc(authRepository);
    });

    tearDown(() async {
      await authBloc.close();
      await currentUserController.close();
    });

    test('initial state is AuthState.initial()', () {
      expect(authBloc.state, const AuthState.initial());
    });

    test(
      'emits AuthState with user when currentUser stream emits user',
      () async {
        const user = User(id: '123', email: 'user@example.com');

        final expectation = expectLater(
          authBloc.stream,
          emitsInOrder([const AuthState(user: user)]),
        );

        currentUserController.add(user);

        await expectation;
      },
    );
  });
}
