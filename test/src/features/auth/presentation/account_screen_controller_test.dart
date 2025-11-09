import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/presentation/account_screen_controller.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepository extends Mock implements FakeAuthRepository {}

void main() {
  group('AccountScreenController', () {
    test('initial state is AsyncValue.data', () {
      final authRepository = MockAuthRepository();
      final controller = AccountScreenControllerNew(
        authRepository: authRepository,
      );
      verifyNever(authRepository.signOut);
      expect(controller.state, AsyncValue<void>.data(null));
    });

    test('signout success', () async {
      // setup
      final authRepository = MockAuthRepository();
      when(() => authRepository.signOut()).thenAnswer((_) => Future.value());
      final controller = AccountScreenControllerNew(
        authRepository: authRepository,
      );
      expect(
        controller.stream,
        emitsInOrder([AsyncLoading<void>(), AsyncData<void>(null)]),
      );
      //run
      await controller.signOut();
      //verify
      verify(authRepository.signOut).called(1);
      expect(controller.state, AsyncData<void>(null));
    });

    test('signout failure', () async {
      // setup
      final authRepository = MockAuthRepository();
      final exception = Exception('Connection failed');
      when(() => authRepository.signOut()).thenThrow(exception);
      final controller = AccountScreenControllerNew(
        authRepository: authRepository,
      );
      expect(
        controller.stream,
        emitsInOrder([
          AsyncLoading<void>(),
          predicate<AsyncValue<void>>((value) {
            expect(value.hasError, true);
            return true;
          }),
        ]),
      );
      //run
      await controller.signOut();
      //verify
      verify(authRepository.signOut).called(1);
      // expect(controller.state.hasError, true);
      // expect(controller.state, isA<AsyncError>());
    }, timeout: const Timeout(Duration(milliseconds: 500)));
  });
}
