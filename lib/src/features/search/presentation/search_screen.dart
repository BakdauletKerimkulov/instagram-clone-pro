import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/features/search/presentation/posts_greed.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.search),
            border: InputBorder.none,
            hintText: 'search'.hardcoded,
          ),
        ),
      ),
      body: PostsGreed(),
    );
  }
}
