// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comments_content_controller.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:instagram_clone_pro/src/utils/current_date_provider.dart';
import 'package:instagram_clone_pro/src/utils/show_snackbar.dart';

class SendCommentField extends ConsumerWidget {
  const SendCommentField({
    super.key,
    this.avatarUrl,
    required this.postId,
    required this.userId,
    required this.focusNode,
    required this.controller,
  });

  final String? avatarUrl;
  final String postId;
  final String userId;
  final FocusNode focusNode;
  final TextEditingController controller;

  void _clearAndReset(WidgetRef ref) {
    controller.text = '';
    ref.read(replyingToCommentIdProvider.notifier).clearTarget();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(sendCommentControllerProvider, (_, state) {
      if (!state.isLoading && state.hasError) {
        showSnackbar(context, Text(state.error.toString()));
      }

      if (!state.isLoading && !state.hasError && state.hasValue) {
        _clearAndReset(ref);
      }
    });

    final state = ref.watch(sendCommentControllerProvider);
    final user = ref.watch(authStateChangesProvider).value;
    final replyingToCommentId = ref.watch(replyingToCommentIdProvider);

    return Column(
      children: [
        TextField(
          controller: controller,
          focusNode: focusNode,
          autofocus: true,
          decoration: InputDecoration(
            icon: CircleAvatar(
              radius: Sizes.p24,
              backgroundImage: AssetImage(
                avatarUrl ?? 'assets/images/noperson.jpg',
              ),
            ),
            hintText: 'Your comment'.hardcoded,
            suffix: IconButton.filled(
              onPressed: state.isLoading || user == null
                  ? null
                  : () {
                      if (controller.text.trim().isEmpty) return;

                      final createdAt = ref.read(currentDateBuilderProvider);
                      final comment = Comment(
                        userId: userId,
                        text: controller.text,
                        likeCount: 0,
                        createdAt: createdAt(),
                      );
                      ref
                          .read(sendCommentControllerProvider.notifier)
                          .sendComment(replyingToCommentId ?? postId, comment);
                    },
              icon: Icon(Icons.send),
              style: IconButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
            border: InputBorder.none,
          ),
        ),
      ],
    );
  }
}
