import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:instagram_clone_pro/src/routing/app_router.dart';

class ReelsAppBar extends StatelessWidget implements PreferredSizeWidget {
  const ReelsAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      backgroundColor: Colors.transparent,
      leading: BackButton(
        color: AppColors.reelsPrimaryButton,
        onPressed: () => context.goNamed(AppRoute.home.name),
      ),
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'Reels'.hardcoded,
            style: TextStyle(color: AppColors.reelsTextColor),
          ),
          Text(
            'Friends'.hardcoded,
            style: TextStyle(color: AppColors.reelsTextColor),
          ),
        ],
      ),
      actions: [SizedBox(width: Sizes.p24)],
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
