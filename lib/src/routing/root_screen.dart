import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key, required this.navigationShell});

  final StatefulNavigationShell navigationShell;

  bool _shouldHideBottomBar(BuildContext context) {
    final currentLocation = GoRouterState.of(context).uri.path;

    final hideOnRoutes = ['/chat/', '/profile/'];

    return hideOnRoutes.any((route) => currentLocation.startsWith(route));
  }

  @override
  Widget build(BuildContext context) {
    final hideBottomBar = _shouldHideBottomBar(context);

    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: hideBottomBar
          ? null
          : BottomNavigationBar(
              items: _buildBottomNavBarItems,
              type: BottomNavigationBarType.fixed,
              currentIndex: navigationShell.currentIndex,
              onTap: (index) => navigationShell.goBranch(
                index,
                initialLocation: index == navigationShell.currentIndex,
              ),
              selectedItemColor: AppColors.primaryColor,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              iconSize: Sizes.p30,
            ),
    );
  }

  List<BottomNavigationBarItem> get _buildBottomNavBarItems => [
    BottomNavigationBarItem(
      icon: _navBarItem('assets/icons/instagram_home_feed_icon.svg'),
      activeIcon: _navBarItem('assets/icons/instagram_home_filled.svg'),
      label: 'home',
    ),
    BottomNavigationBarItem(
      icon: _navBarItem('assets/icons/instagram-reels-icon.svg'),
      activeIcon: _navBarItem('assets/icons/instagram_reels_icon_full.svg'),
      label: 'reels',
    ),
    BottomNavigationBarItem(
      icon: _navBarItem('assets/icons/instagram_share_icon.svg'),
      label: 'direct',
    ),
    BottomNavigationBarItem(
      icon: _navBarItem('assets/icons/instagram-search-icon.svg'),
      label: 'search',
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.person_outline_outlined),
      activeIcon: Icon(Icons.person),
      label: 'profile',
    ),
  ];
}

Widget _navBarItem(String icon, {double width = 24, double height = 24}) {
  return SvgPicture.asset(icon, width: width, height: height);
}
