import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/application/comments_service.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment_with_user.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comments_content_controller.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:instagram_clone_pro/src/utils/app_show_menu.dart';
import 'package:instagram_clone_pro/src/utils/format_time.dart';

class CommentListTile extends ConsumerWidget {
  const CommentListTile({
    super.key,
    required this.commentWithUser,
    required this.parentId,
    this.isReplies = false,
    required this.onReplyTap,
  });
  final CommentWithUser commentWithUser;
  final String parentId;
  final bool isReplies;
  final Function(String userName) onReplyTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authRepositoryProvider).currentUser;
    final formatTime = ref.read(formatTimeProvider);
    final isLiked = ref.watch(
      commentIsLikedProvider(parentId, commentWithUser.comment.id),
    );

    return GestureDetector(
      onLongPress: () {
        final items = [
          if (user != null && user.uid == commentWithUser.user.uid)
            PopupMenuItem<String>(
              value: 'delete'.hardcoded,
              child: Text(
                'Delete'.hardcoded,
                style: const TextStyle(color: Colors.red),
              ),
            ),
        ];

        appShowMenu(
          context: context,
          items: items,
          onSelected: (action) {
            if (action == 'delete') {
              ref
                  .read(commentsServiceProvider)
                  .removeCommentById(parentId, commentWithUser.comment.id);
            }
          },
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          radius: 24,
          backgroundImage: AssetImage(commentWithUser.user.avatarUrl),
          backgroundColor: Colors.grey,
        ),
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              commentWithUser.user.userName,
              style: TextStyle(fontSize: Sizes.p12),
            ),
            gapW8,
            Text(
              formatTime(commentWithUser.comment.createdAt),
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: Sizes.p12,
              ),
            ),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(commentWithUser.comment.text),
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(replyingToCommentIdProvider.notifier)
                          .setTarget(
                            isReplies ? parentId : commentWithUser.comment.id,
                          );
                      onReplyTap.call(commentWithUser.user.userName);
                    },
                    child: Text('reply'.hardcoded),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: Sizes.p16),
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      ref
                          .read(commentsServiceProvider)
                          .toggleCommentLike(
                            parentId,
                            commentWithUser.comment.id,
                          );
                    },
                    child: Icon(
                      isLiked ? Icons.favorite : Icons.favorite_border_outlined,
                      color: isLiked ? Colors.red : null,
                      size: Sizes.p20,
                    ),
                  ),

                  if (commentWithUser.comment.likeCount > 0)
                    Text(
                      commentWithUser.comment.likeCount.toString(),
                      style: TextStyle(fontSize: Sizes.p12),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
