// ignore_for_file: public_member_api_docs, sort_constructors_first

class AppUser {
  const AppUser({
    required this.uid,
    required this.email,
    required this.avatarUrl,
    required this.userName,
  });

  final String uid;
  final String email;
  final String userName;
  final String avatarUrl;

  @override
  String toString() => 'AppUser(uid: $uid, email: $email)';

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;

    return other.uid == uid && other.email == email;
  }

  @override
  int get hashCode => uid.hashCode ^ email.hashCode;
}
