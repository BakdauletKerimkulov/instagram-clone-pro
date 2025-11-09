import 'dart:async';

import 'package:flutter_riverpod/legacy.dart';
import 'package:instagram_clone_pro/src/features/auth/data/auth_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'account_screen_controller.g.dart';

@riverpod
class AccountScreenController extends _$AccountScreenController {
  @override
  FutureOr<void> build() {
    // nothing to do
    return null;
  }

  Future<void> signOut() async {
    final authRepository = ref.read(authRepositoryProvider);
    state = const AsyncLoading<void>();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}

class AccountScreenControllerNew extends StateNotifier<AsyncValue<void>> {
  AccountScreenControllerNew({required this.authRepository})
    : super(AsyncData(null));
  final AuthRepository authRepository;

  Future<void> signOut() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => authRepository.signOut());
  }
}
