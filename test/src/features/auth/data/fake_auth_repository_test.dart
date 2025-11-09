import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';

void main() {
  const testEmail = 'test@test.com';
  const testPassword = '12345678';
  final testUser = AppUser(
    uid: testEmail.split('').reversed.join(),
    email: testEmail,
    avatarUrl: '',
    userName: '',
  );

  FakeAuthRepository makeAuthRepository() =>
      FakeAuthRepository(addDelay: false);

  group('FakeAuthRepository', () {
    test('currentUser is null', () {
      final authRepository = makeAuthRepository();
      expect(authRepository.currentUser, null);
      expect(authRepository.authStateChanges(), emits(null));
    });

    test('currentUser is not null after signIn', () async {
      final authRepository = makeAuthRepository();
      await authRepository.signInWithEmailAndPassword(testEmail, testPassword);
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('currentUser is not null after registration', () async {
      final authRepository = makeAuthRepository();
      await authRepository.createUserWithEmailAndPassword(
        testEmail,
        testPassword,
      );
      expect(authRepository.currentUser, testUser);
      expect(authRepository.authStateChanges(), emits(testUser));
    });

    test('current user is null after signOut', () async {
      final authRepository = makeAuthRepository();
      await authRepository.signInWithEmailAndPassword(testEmail, testPassword);
      expect(authRepository.authStateChanges(), emitsInOrder([testUser, null]));
      await authRepository.signOut();
      expect(authRepository.currentUser, null);
    });

    test('sign in after dispose throw exception', () {
      final authRepository = makeAuthRepository();
      authRepository.dispose();
      expect(
        () =>
            authRepository.signInWithEmailAndPassword(testEmail, testPassword),
        throwsStateError,
      );
    });
  });
}
