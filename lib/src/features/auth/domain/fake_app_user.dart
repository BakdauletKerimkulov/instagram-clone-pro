import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';

class FakeAppUser extends AppUser {
  FakeAppUser({
    required super.uid,
    required super.email,
    required super.avatarUrl,
    required super.userName,
    required this.password,
  });
  final String password;
}
