import 'package:instagram_clone_pro/src/features/comments/application/comments_service.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'comments_content_controller.g.dart';

@riverpod
class SendCommentController extends _$SendCommentController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  CommentsService get _commentsService => ref.read(commentsServiceProvider);

  Future<void> sendComment(String parentId, Comment comment) async {
    state = AsyncLoading<void>();
    state = await AsyncValue.guard<void>(
      () => _commentsService.sendComment(parentId, comment),
    );
  }
}

@riverpod
class ReplyingToCommentId extends _$ReplyingToCommentId {
  @override
  String? build() => state = null;

  void setTarget(String commentId) {
    state = commentId;
  }

  void clearTarget() => state = null;
}
