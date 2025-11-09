// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/features/search/presentation/grid_post_list_provider.dart';
import 'package:instagram_clone_pro/src/features/search/presentation/post_grid_card.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class PostsGreed extends ConsumerWidget {
  const PostsGreed({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postsListValue = ref.watch(gridPostListProvider);
    return AsyncValueWidget(
      value: postsListValue,
      data: (posts) => posts.isEmpty
          ? Center(child: Text('No posts'.hardcoded))
          : PostsLayoutGrid(
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostGridCard(post);
              },
            ),
    );
  }
}

class PostsLayoutGrid extends StatelessWidget {
  const PostsLayoutGrid({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisSpacing: 1,
      mainAxisSpacing: 1,
      crossAxisCount: 3,
      children: [for (var i = 0; i < itemCount; i++) itemBuilder(context, i)],
    );
  }
}
