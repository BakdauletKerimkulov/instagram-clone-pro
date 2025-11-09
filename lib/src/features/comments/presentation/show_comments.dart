import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comments_content.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

void showComments(BuildContext context, String postId) {
  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    barrierLabel: 'Comments'.hardcoded,
    useSafeArea: true,
    builder: (context) => CommentsContent(postId),
  );
}
