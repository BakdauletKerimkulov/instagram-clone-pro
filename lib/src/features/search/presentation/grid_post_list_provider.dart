import 'package:instagram_clone_pro/src/features/search/data/grid_posts_repository.dart';
import 'package:instagram_clone_pro/src/features/search/domain/grid_item_post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grid_post_list_provider.g.dart';

@riverpod
Future<List<GridItemPost>> gridPostList(Ref ref) {
  final repository = ref.watch(gridPostsRepositoryProvider);
  return repository.fetchGreedItemPosts();
}
