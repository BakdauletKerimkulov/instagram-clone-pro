import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';

class MuteButton extends StatelessWidget {
  const MuteButton({
    super.key,
    required this.isMuted,
    required this.onTap,
    required this.radius,
    required this.iconSize,
  });

  final bool isMuted;
  final VoidCallback onTap;
  final double radius;
  final double iconSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius,
        backgroundColor: AppColors.reelsButtonBackColor,
        child: Icon(
          isMuted ? Icons.volume_off_rounded : Icons.volume_up,
          color: AppColors.reelsPrimaryButton,
          size: iconSize,
        ),
      ),
    );
  }
}
