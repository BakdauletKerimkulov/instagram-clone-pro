// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/comments/application/comments_service.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment_with_user.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comment_list_tile.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comments_item_builder.dart';

class CommentTree extends ConsumerWidget {
  const CommentTree({
    super.key,
    required this.parentComment,
    required this.postId,
    required this.onReplyTap,
    this.level = 0,
  });

  final CommentWithUser parentComment;
  final String postId;
  final int level;
  final Function(String userName) onReplyTap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final replies = ref.watch(
      commentWithUserProvider(parentComment.comment.id),
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: Sizes.p16 * level),
          child: CommentListTile(
            commentWithUser: parentComment,
            parentId: postId,
            onReplyTap: onReplyTap,
          ),
        ),

        Padding(
          padding: EdgeInsets.only(left: Sizes.p48 * (level + 1)),
          child: AsyncValueWidget(
            value: replies,
            data: (reply) {
              return CommentsItemBuilder(
                shrinkWrap: true,
                physics: true,
                itemCount: reply.length,
                itemBuilder: (context, index) {
                  final replyItem = reply[index];

                  return CommentListTile(
                    commentWithUser: replyItem,
                    parentId: parentComment.comment.id,
                    isReplies: true,
                    onReplyTap: onReplyTap,
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
