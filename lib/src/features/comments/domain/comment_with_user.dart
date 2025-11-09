// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';

class CommentWithUser {
  CommentWithUser({required this.comment, required this.user});
  final Comment comment;
  final AppUser user;
}
