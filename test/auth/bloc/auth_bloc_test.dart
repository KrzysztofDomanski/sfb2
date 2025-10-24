import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:sfb/features/auth/bloc/auth_bloc.dart';
import 'package:sfb/features/auth/domain/auth_repository.dart';
import 'package:sfb/features/auth/domain/sign_in.dart';
import 'package:sfb/features/auth/domain/user.dart';

import 'auth_bloc_test.mocks.dart';

@GenerateMocks([AuthRepository, SignIn])
void main() {
  group('AuthBloc', () {
    late AuthBloc authBloc;
    late MockAuthRepository authRepository;
    late MockSignIn signIn;
    late StreamController<User?> currentUserController;

    setUp(() {
      authRepository = MockAuthRepository();
      signIn = MockSignIn();
      currentUserController = StreamController<User?>();
      when(
        authRepository.currentUser,
      ).thenAnswer((_) => currentUserController.stream);
      authBloc = AuthBloc(authRepository, signIn);
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

    blocTest<AuthBloc, AuthState>(
      'calls SignIn use case when SignInRequested event is added',
      build: () {
        return authBloc;
      },
      act: (bloc) =>
          bloc.add(const SignInRequested('test@example.com', 'password')),
      verify: (_) {
        verify(
          signIn.call(
            SignInParams(email: 'test@example.com', password: 'password'),
          ),
        ).called(1);
      },
    );

    blocTest(
      'Calls SignIn once use case throws an exception',
      build: () {
        when(signIn.call(any)).thenThrow(Exception('SignIn failed'));
        return authBloc;
      },
      act: (bloc) =>
          bloc.add(const SignInRequested('test@example.com', 'password')),
      verify: (_) {
        verify(
          signIn.call(
            SignInParams(email: 'test@example.com', password: 'password'),
          ),
        ).called(1);
      },
    );
  });
}
