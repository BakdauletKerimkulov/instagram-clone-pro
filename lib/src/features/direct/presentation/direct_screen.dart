import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/direct/presentation/direct_list.dart';
import 'package:instagram_clone_pro/src/features/direct/presentation/direct_search.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class DirectScreen extends StatelessWidget {
  const DirectScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.edit_square)),
        title: Text('Direct'.hardcoded),
        centerTitle: true,
      ),
      body: CustomScrollView(
        physics: PageScrollPhysics(
          parent: BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
        ),
        scrollBehavior: ScrollBehavior(),
        slivers: [
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p16),
              child: TextField(
                onTap: () {
                  showSearch(context: context, delegate: DirectSearch());
                },
                readOnly: true,
                decoration: InputDecoration(
                  filled: true,
                  contentPadding: EdgeInsets.symmetric(vertical: Sizes.p4),
                  prefixIcon: Icon(Icons.search),
                  hintText: 'Search'.hardcoded,
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(Sizes.p16),
                  ),
                ),
              ),
            ),
          ),
          DirectList(),
        ],
      ),
    );
  }
}
