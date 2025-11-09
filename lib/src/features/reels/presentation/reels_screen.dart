import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/features/reels/presentation/reels_app_bar.dart';
import 'package:instagram_clone_pro/src/features/reels/presentation/reels_list_new.dart';

class ReelsScreen extends StatelessWidget {
  const ReelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ReelsAppBar(),
      body: ReelsListNew(),
      backgroundColor: AppColors.reelsBackgroundColor,
    );
  }
}
