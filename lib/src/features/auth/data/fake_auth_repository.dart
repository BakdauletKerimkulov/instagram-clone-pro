import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/constants/test_user.dart';
import 'package:instagram_clone_pro/src/exceptions/app_exceptions.dart';
import 'package:instagram_clone_pro/src/features/auth/data/auth_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';
import 'package:instagram_clone_pro/src/features/auth/domain/fake_app_user.dart';
import 'package:instagram_clone_pro/src/utils/delay.dart';
import 'package:instagram_clone_pro/src/utils/in_memory_store.dart';

class FakeAuthRepository implements AuthRepository {
  FakeAuthRepository({this.addDelay = false});
  final bool addDelay;

  final _authState = InMemoryStore<AppUser?>(kTestUser);

  final List<FakeAppUser> _users = [];

  @override
  Stream<AppUser?> authStateChanges() => _authState.stream;

  @override
  AppUser? get currentUser => _authState.value;

  @override
  Future<void> createUserWithEmailAndPassword(
    String email,
    String password,
  ) async {
    await delay(addDelay);
    // check if the email is already in use
    for (final u in _users) {
      if (u.email == email) {
        throw EmailAlreadyInUseException();
      }
    }
    // minimum password length requirement
    if (password.length < 8) {
      throw WeakPasswordException();
    }
    // create new user
    _createNewUser(email, password);
  }

  @override
  Future<void> signInWithEmailAndPassword(String email, String password) async {
    await delay(addDelay);

    if (currentUser == null) {
      _createNewUser(email, password);
    }

    // for (final u in _users) {
    //   if (u.email == email && u.password == password) {
    //     _authState.value = u;
    //     return;
    //   }

    //   if (u.email == email && u.password != password) {
    //     throw WrongPasswordException();
    //   }
    // }

    // throw UserNotFoundException();
  }

  @override
  Future<void> signOut() async => _authState.value = null;

  @override
  void dispose() => _authState.close();

  void _createNewUser(String email, String password) {
    // create new user
    final user = FakeAppUser(
      uid: email.split('').reversed.join(),
      email: email,
      password: password,
      avatarUrl: '',
      userName: '',
    );
    // register it
    _users.add(user);
    // update the auth state
    _authState.value = user;
  }
}

final authRepositoryProvider = Provider<FakeAuthRepository>((ref) {
  return FakeAuthRepository();
});

final authStateChangesProvider = StreamProvider<AppUser?>((ref) {
  final authRepository = ref.watch(authRepositoryProvider);
  return authRepository.authStateChanges();
});
