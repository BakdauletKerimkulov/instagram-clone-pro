import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/constants/test_user.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';
import 'package:instagram_clone_pro/src/utils/in_memory_store.dart';

class FakeUserRepository implements UserRepository {
  final _users = InMemoryStore<List<AppUser>>(kTestUserList);

  @override
  Future<AppUser?> fetchUser(String id) {
    try {
      final user = _users.value.firstWhere((user) => user.uid == id);
      debugPrint(user.toString());
      return Future.value(user);
    } catch (e) {
      debugPrint(e.toString());
      return Future.value(null);
    }
  }

  @override
  Future<List<AppUser>> fetchUsers(List<String> ids) {
    final filteredUsers = _users.value
        .where((user) => ids.contains(user.uid))
        .toList();
    return Future.value(filteredUsers);
  }

  @override
  Stream<List<AppUser>> findUserByUsername(String username) {
    return _users.stream.map((users) {
      return users.where((user) {
        final userNameLower = user.userName.toLowerCase();
        final usernameLower = username.toLowerCase();

        return userNameLower.contains(usernameLower);
      }).toList();
    });
  }
}
