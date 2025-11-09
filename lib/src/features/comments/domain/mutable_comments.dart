import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';

extension MutableComments on Comments {
  Comments setItem(Comment comment) {
    final copy = Map<CommentID, Comment>.from(items);
    copy[comment.id] = comment;
    debugPrint('comment has been set');
    return Comments(copy);
  }

  Comments removeItemById(CommentID id) {
    final copy = Map<CommentID, Comment>.from(items);
    copy.remove(id);
    return Comments(copy);
  }

  Comments toggleCommentLike(CommentID id) {
    final copy = Map<CommentID, Comment>.from(items);
    copy.update(id, (comment) {
      final newIsLiked = !comment.isLiked;
      final newLikeCount = newIsLiked
          ? comment.likeCount + 1
          : comment.likeCount - 1;

      final newComment = comment.copyWith(
        isLiked: newIsLiked,
        likeCount: newLikeCount.clamp(0, double.infinity).toInt(),
      );
      return newComment;
    });
    return Comments(copy);
  }
}
