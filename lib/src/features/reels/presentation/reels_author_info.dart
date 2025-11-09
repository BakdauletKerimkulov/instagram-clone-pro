// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

const authorInfoTextStyle = TextStyle(
  fontWeight: FontWeight.w500,
  fontSize: Sizes.p16,
  color: AppColors.reelsTextColor,
);
const outlinedButtonRadius = 10.0;

class ReelsAuthorInfo extends ConsumerWidget {
  const ReelsAuthorInfo({super.key, required this.authorId});

  final String authorId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final author = ref.watch(fetchUserProvider(authorId));

    return author.when(
      data: (user) => Padding(
        padding: const EdgeInsets.all(Sizes.p16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: AssetImage(user!.avatarUrl)),
                gapW12,
                Text(user.userName, style: authorInfoTextStyle),
                gapW12,
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: AppColors.reelsOutlineColor,
                      width: 1.0,
                    ),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(outlinedButtonRadius),
                    ),
                  ),
                  onPressed: () {},
                  child: Text(
                    'following'.hardcoded,
                    style: authorInfoTextStyle,
                  ),
                ),
              ],
            ),

            Text('description'.hardcoded, style: authorInfoTextStyle),
          ],
        ),
      ),
      error: (e, st) => SizedBox(),
      loading: () => SizedBox(),
    );
  }
}
