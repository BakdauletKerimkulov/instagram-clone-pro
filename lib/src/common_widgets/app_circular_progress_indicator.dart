import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';

class AppCircularProgressIndicator extends StatelessWidget {
  const AppCircularProgressIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: AppColors.circularProgressIndicator,
        backgroundColor: AppColors.circularProgressIndicatorBackground,
      ),
    );
  }
}
