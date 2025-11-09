import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  const HomeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      snap: true,
      leading: IconButton(
        onPressed: () {},
        icon: Icon(Icons.add, size: Sizes.p32),
      ),
      centerTitle: true,
      title: Text(
        'Instagram'.hardcoded,
        style: TextStyle(
          fontFamily: 'BillabongTTF',
          fontWeight: FontWeight.w500,
          fontSize: Sizes.p40,
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/instagram_heart_icon.svg',
            width: Sizes.p24,
            height: Sizes.p24,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60.0);
}
