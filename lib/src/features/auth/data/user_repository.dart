import 'package:instagram_clone_pro/src/constants/app_duration.dart';
import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:rxdart/rxdart.dart';

part 'user_repository.g.dart';

abstract class UserRepository {
  Future<List<AppUser>> fetchUsers(List<String> ids);

  Future<AppUser?> fetchUser(String id);

  Stream<List<AppUser>> findUserByUsername(String username);
}

@Riverpod(keepAlive: true)
UserRepository userRepository(Ref ref) => throw UnimplementedError();

@riverpod
Future<AppUser?> fetchUser(Ref ref, String id) async {
  final userRepository = ref.read(userRepositoryProvider);
  return await userRepository.fetchUser(id);
}

@riverpod
Future<List<AppUser>> userList(Ref ref, List<String> ids) async {
  final userRepository = ref.read(userRepositoryProvider);
  return await userRepository.fetchUsers(ids);
}

@riverpod
Stream<List<AppUser>> findUserByUsername(Ref ref, String username) {
  final repo = ref.watch(userRepositoryProvider);

  return Stream.value(
    username,
  ).debounceTime(AppDuration.ms300).asyncExpand(repo.findUserByUsername);
}
