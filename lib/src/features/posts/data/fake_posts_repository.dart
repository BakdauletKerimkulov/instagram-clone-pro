import 'package:instagram_clone_pro/src/constants/test_posts.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_posts_repository.g.dart';

class FakePostsRepository {
  final _posts = InMemoryStore<List<MediaPost>>(kTestPosts);

  List<MediaPost> getPostsList() {
    return _posts.value;
  }

  MediaPost? getPost(String id) {
    return _getPost(_posts.value, id);
  }

  Future<List<MediaPost>> fetchPostsList() async {
    return Future.value(_posts.value);
  }

  Stream<List<MediaPost>> watchPostsList() {
    return _posts.stream;
  }

  Stream<MediaPost?> watchPost(String id) {
    return watchPostsList().map((posts) => _getPost(posts, id));
  }

  static MediaPost? _getPost(List<MediaPost> posts, String id) {
    try {
      return posts.firstWhere((post) => post.id == id);
    } catch (e) {
      return null;
    }
  }
}

@riverpod
Stream<List<MediaPost>> postsListStream(Ref ref) {
  final postRepository = ref.watch(fakePostRepositoryProvider);
  return postRepository.watchPostsList();
}

@riverpod
FakePostsRepository fakePostRepository(Ref ref) {
  return FakePostsRepository();
}
