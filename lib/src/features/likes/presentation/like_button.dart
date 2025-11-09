// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/likes/application/like_service_provider.dart';
import 'package:instagram_clone_pro/src/features/likes/domain/like.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class LikeButton extends ConsumerWidget {
  const LikeButton({super.key, required this.parentId, this.isReels = false});

  final String parentId;
  final bool isReels;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;
    final isLiked = ref.watch(isLikedByUserProvider(parentId)).value;

    return isReels
        ? Column(
            children: [
              IconButton(
                onPressed: () {
                  if (user != null) {
                    final like = Like(
                      parentId: parentId,
                      userId: user.uid,
                      createdAt: DateTime.now(),
                    );
                    ref
                        .read(toggleLikeControllerProvider.notifier)
                        .toggleLike(parentId, like);
                  }
                },
                icon: isLiked != null && isLiked
                    ? SvgPicture.asset(
                        'assets/icons/instagram_heart_icon_filled.svg',
                        colorFilter: ColorFilter.mode(
                          Colors.red,
                          BlendMode.srcIn,
                        ),
                        height: 24,
                        width: 24,
                      )
                    : SvgPicture.asset(
                        'assets/icons/instagram_heart_icon.svg',
                        height: 24,
                        width: 24,
                        colorFilter: ColorFilter.mode(
                          AppColors.reelsPrimaryButton,
                          BlendMode.srcIn,
                        ),
                      ),
              ),
              Text(
                '200'.hardcoded,
                style: TextStyle(color: AppColors.reelsTextColor),
              ),
            ],
          )
        : IconButton(
            iconSize: Sizes.p24,
            onPressed: () {
              if (user != null) {
                final like = Like(
                  parentId: parentId,
                  userId: user.uid,
                  createdAt: DateTime.now(),
                );
                ref
                    .read(toggleLikeControllerProvider.notifier)
                    .toggleLike(parentId, like);
              }
            },
            icon: Row(
              children: [
                isLiked != null && isLiked
                    ? SvgPicture.asset(
                        'assets/icons/instagram_heart_icon_filled.svg',
                        colorFilter: ColorFilter.mode(
                          Colors.red,
                          BlendMode.srcIn,
                        ),
                        height: 24,
                        width: 24,
                      )
                    : SvgPicture.asset(
                        'assets/icons/instagram_heart_icon.svg',
                        height: 24,
                        width: 24,
                      ),
                gapW4,
                Text('200'.hardcoded),
              ],
            ),
          );
  }
}
