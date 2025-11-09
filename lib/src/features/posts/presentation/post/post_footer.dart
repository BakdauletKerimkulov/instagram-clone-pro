import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comment_button.dart';
import 'package:instagram_clone_pro/src/features/likes/presentation/like_button.dart';

class PostFooter extends ConsumerWidget {
  const PostFooter(this.postId, {super.key});

  final String postId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      children: [
        LikeButton(parentId: postId),
        CommentButton(postId: postId),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/instagram_share_icon.svg',
            height: 24,
            width: 24,
          ),
        ),
        Spacer(),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/instagram-save-icon.svg',
            height: 24,
            width: 24,
          ),
        ),
      ],
    );
  }
}
