import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';

class ErrorMessageWidget extends StatelessWidget {
  const ErrorMessageWidget(this.errorMessage, {super.key});
  final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: MediaQuery.of(context).size.width / 2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.error, color: AppColors.reelsTextColor, size: Sizes.p40),
            gapH16,
            Text(
              errorMessage,
              style: Theme.of(
                context,
              ).textTheme.titleLarge!.copyWith(color: AppColors.reelsTextColor),
            ),
          ],
        ),
      ),
    );
  }
}
