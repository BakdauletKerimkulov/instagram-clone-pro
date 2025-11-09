import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/home_app_bar.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post/posts_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: [HomeAppBar(), PostsList()],
      ),
    );
  }
}
