import 'package:instagram_clone_pro/src/features/search/domain/grid_item_post.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'grid_posts_repository.g.dart';

abstract class GridPostsRepository {
  Future<List<GridItemPost>> fetchGreedItemPosts();

  Stream<List<GridItemPost>> watchItemPosts();
}

@Riverpod(keepAlive: true)
GridPostsRepository gridPostsRepository(Ref ref) => throw UnimplementedError();
