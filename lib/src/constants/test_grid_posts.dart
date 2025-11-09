import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/features/search/domain/grid_item_post.dart';

final List<GridItemPost> kTestGridPosts = List.generate(50, (index) {
  return GridItemPost(
    postId: 'post_$index',
    mediaUrl:
        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRyAr5JDqj3KvjZir9L1sIB-idizPmXufPzxg&s',
    postType: PostType.photo,
  );
});
