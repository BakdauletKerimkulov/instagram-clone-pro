// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/comments/application/comments_service.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/show_comments.dart';

class CommentButton extends ConsumerWidget {
  const CommentButton({super.key, required this.postId, this.isReels = false});

  final String postId;
  final bool isReels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final commentsCount = ref.watch(commentsCountProvider(postId));
    return IconButton(
      onPressed: () => showComments(context, postId),
      icon: isReels
          ? Column(
              children: [
                SvgPicture.asset(
                  'assets/icons/instagram_comment_icon.svg',
                  height: 24,
                  width: 24,
                  colorFilter: ColorFilter.mode(
                    AppColors.reelsPrimaryButton,
                    BlendMode.srcIn,
                  ),
                ),
                gapW4,
                if (commentsCount > 0)
                  Text(
                    commentsCount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Sizes.p16,
                      color: AppColors.reelsPrimaryButton,
                    ),
                  ),
              ],
            )
          : Row(
              children: [
                SvgPicture.asset(
                  'assets/icons/instagram_comment_icon.svg',
                  height: 24,
                  width: 24,
                ),
                gapW4,
                if (commentsCount > 0)
                  Text(
                    commentsCount.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: Sizes.p16,
                    ),
                  ),
              ],
            ),
    );
  }
}
