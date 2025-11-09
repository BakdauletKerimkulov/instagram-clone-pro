import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone_pro/src/constants/test_posts.dart';
import 'package:instagram_clone_pro/src/features/posts/data/fake_posts_repository.dart';

void main() {
  group('FakePostRepository', () {
    test('getPostsList returns global list', () {
      final postsRepository = FakePostsRepository();
      expect(postsRepository.getPostsList(), kTestPosts);
    });

    test('getPost(1) returns first item', () {
      final postsRepository = FakePostsRepository();
      expect(postsRepository.getPost('1'), kTestPosts[0]);
    });

    test('getPost(100) returns null', () {
      final postsRepository = FakePostsRepository();

      expect(postsRepository.getPost('100'), null);
    });
  });

  test('fetchPostsList returns global list', () async {
    final postsRepository = FakePostsRepository();

    expect(await postsRepository.fetchPostsList(), kTestPosts);
  });

  test('watchPostsList emits global list', () {
    final postsRepository = FakePostsRepository();

    expect(postsRepository.watchPostsList(), emits(kTestPosts));
  });

  test('wathcProduct(1) emits first item', () {
    final postsRepository = FakePostsRepository();
    expect(postsRepository.watchPost('1'), emits(kTestPosts[0]));
  });

  test('watchProduct(100) emits null', () {
    final postsRepository = FakePostsRepository();

    expect(postsRepository.watchPost('100'), emits(null));
  });
}
