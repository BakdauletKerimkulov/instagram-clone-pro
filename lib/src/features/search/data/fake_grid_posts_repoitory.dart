import 'package:instagram_clone_pro/src/constants/test_grid_posts.dart';
import 'package:instagram_clone_pro/src/features/search/data/grid_posts_repository.dart';
import 'package:instagram_clone_pro/src/features/search/domain/grid_item_post.dart';
import 'package:instagram_clone_pro/src/utils/in_memory_store.dart';

class FakeGridPostsRepoitory implements GridPostsRepository {
  final _gridPosts = InMemoryStore<List<GridItemPost>>(kTestGridPosts);

  @override
  Future<List<GridItemPost>> fetchGreedItemPosts() {
    return Future.value(_gridPosts.value);
  }

  @override
  Stream<List<GridItemPost>> watchItemPosts() {
    return _gridPosts.stream;
  }
}
