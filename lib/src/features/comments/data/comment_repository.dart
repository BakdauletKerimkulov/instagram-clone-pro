import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comment_repository.g.dart';

abstract class CommentRepository {
  Future<Comments> fetchCommentList(String postId);

  Future<void> setComments(String postId, Comments comments);

  Stream<Comments> watchCommentList(String parentId);

  Future<void> deleteCommentsByParentId(String postId);

  Future<bool> checkKeyExists(String key);
}

@Riverpod(keepAlive: true)
CommentRepository commentRepository(Ref ref) => throw UnimplementedError();
