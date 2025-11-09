import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/features/posts/data/fake_posts_repository.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post/post_card.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class PostsList extends ConsumerWidget {
  const PostsList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final posts = ref.watch(postsListStreamProvider);
    return AsyncValueSliverWidget(
      value: posts,
      data: (posts) => posts.isEmpty
          ? SliverToBoxAdapter(child: Center(child: Text('No data'.hardcoded)))
          : SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final post = posts[index];
                return PostCard(post: post);
              }, childCount: posts.length),
            ),
    );
  }
}

class PostsLayoutList extends StatelessWidget {
  const PostsLayoutList({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
  });

  //Total number of items
  final int itemCount;

  //Function user to build a widget for a given index in the list
  final Widget Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return ListView.builder(itemCount: itemCount, itemBuilder: itemBuilder);
      },
    );
  }
}
