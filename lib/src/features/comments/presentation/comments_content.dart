import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/application/comments_service.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comment_tree.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comments_item_builder.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/send_comment_field.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class CommentsContent extends ConsumerStatefulWidget {
  const CommentsContent(this.postId, {super.key});

  final String postId;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _CommentsContentNewState();
}

class _CommentsContentNewState extends ConsumerState<CommentsContent> {
  final FocusNode _focusNode = FocusNode();
  final _controller = TextEditingController();

  @override
  void dispose() {
    _focusNode.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final commentsValue = ref.watch(commentWithUserProvider(widget.postId));
    final user = ref.read(authRepositoryProvider).currentUser;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 4.0, top: 16),
              child: Text(
                'Comments'.hardcoded,
                style: TextStyle(fontSize: 18.0),
              ),
            ),
          ],
        ),
        Expanded(
          child: AsyncValueWidget(
            value: commentsValue,
            data: (commentsWithUser) {
              return CommentsItemBuilder(
                itemCount: commentsWithUser.length,
                itemBuilder: (context, index) {
                  final item = commentsWithUser[index];
                  return CommentTree(
                    parentComment: item,
                    postId: widget.postId,
                    onReplyTap: (userName) {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        _controller.text = '@$userName ';
                        _focusNode.requestFocus();
                      });
                    },
                  );
                },
              );
            },
          ),
        ),

        SendCommentField(
          postId: widget.postId,
          userId: user?.uid ?? '1',
          avatarUrl: user?.avatarUrl,
          focusNode: _focusNode,
          controller: _controller,
        ),
      ],
    );
  }
}
