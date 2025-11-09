import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/data/comment_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment_with_user.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/mutable_comments.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comments_service.g.dart';

class CommentsService {
  CommentsService(this.ref);
  final Ref ref;

  CommentRepository get _commentRepository =>
      ref.read(commentRepositoryProvider);

  Future<void> sendComment(String parentId, Comment comment) async {
    final newComments = await _commentRepository.fetchCommentList(parentId);

    final updated = newComments.setItem(comment);
    await _commentRepository.setComments(parentId, updated);
  }

  Future<void> removeCommentById(String parentId, CommentID id) async {
    final newComments = await _commentRepository.fetchCommentList(parentId);
    final updated = newComments.removeItemById(id);

    final hasReplies = await _commentRepository.checkKeyExists(id);
    if (hasReplies) {
      await _commentRepository.deleteCommentsByParentId(id);
    }

    await _commentRepository.setComments(parentId, updated);
  }

  Future<void> toggleCommentLike(String parentId, CommentID id) async {
    final newComments = await _commentRepository.fetchCommentList(parentId);
    final updated = newComments.toggleCommentLike(id);
    await _commentRepository.setComments(parentId, updated);
  }
}

@Riverpod(keepAlive: true)
CommentsService commentsService(Ref ref) => CommentsService(ref);

@Riverpod(keepAlive: true)
Stream<Comments> comments(Ref ref, String parentId) {
  return ref.watch(commentRepositoryProvider).watchCommentList(parentId);
}

@riverpod
Stream<List<CommentWithUser>> commentWithUser(Ref ref, String id) {
  // 1. Смотрим на поток сырых комментариев из Sembast (реактивный)
  final rawCommentsStream = ref
      .watch(commentRepositoryProvider)
      .watchCommentList(id);

  // 2. Преобразуем Stream<Comments> в Stream<List<CommentWithUser>>
  return rawCommentsStream.asyncMap((commentsMap) async {
    final comments = commentsMap.toItemsList();
    if (comments.isEmpty) return [];

    final uniqueUserIds = comments.map((c) => c.userId).toSet();

    // Получаем всех пользователей (Future)
    final users = await ref
        .read(userRepositoryProvider)
        .fetchUsers(uniqueUserIds.toList());
    final usersMap = {for (var user in users) user.uid: user};

    debugPrint(users.length.toString());

    // Собираем финальный список
    return comments
        .map((comment) {
          final user = usersMap[comment.userId];
          return user != null
              ? CommentWithUser(comment: comment, user: user)
              : null;
        })
        .whereType<
          CommentWithUser
        >() // Удаляем null, если пользователь не найден
        .toList();
  });
}

@Riverpod(keepAlive: true)
int commentsCount(Ref ref, String parentId) {
  final asyncComments = ref.watch(commentsProvider(parentId));

  return asyncComments.when(
    data: (comments) {
      if (comments.items.isEmpty) {
        return 0;
      }

      var totalCount = comments.items.length;

      for (final comment in comments.items.entries) {
        final repliesCount = ref.watch(commentsCountProvider(comment.value.id));
        totalCount += repliesCount;
      }

      return totalCount;
    },
    error: (er, st) => 0,
    loading: () => 0,
  );
}

@Riverpod(keepAlive: true)
int commentLikeCount(Ref ref, String parentId, String commentId) {
  final comments =
      ref.watch(commentsProvider(parentId)).value ?? const Comments();

  return comments.items[commentId]?.likeCount ?? 0;
}

@Riverpod(keepAlive: true)
bool commentIsLiked(Ref ref, String parentId, String commentId) {
  final asyncComments = ref.watch(commentsProvider(parentId));

  return asyncComments.maybeWhen(
    data: (comments) {
      final comment = comments.items[commentId];
      if (comment != null) {
        return comment.isLiked;
      } else {
        return false;
      }
    },
    orElse: () => false,
  );
}
