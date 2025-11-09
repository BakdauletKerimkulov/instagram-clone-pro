import 'package:instagram_clone_pro/src/constants/test_posts.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_reels_repository.g.dart';

class FakeReelsRepository {
  final _reels = InMemoryStore<List<MediaPost>>(kTestPosts);

  Future<List<MediaPost>> fetchReels() => Future.value(
    _reels.value
        .where(
          (post) =>
              post.postType == PostType.reel || post.postType == PostType.video,
        )
        .toList(),
  );

  Stream<List<MediaPost>> watchReels() => _reels.stream.map(
    (list) => list
        .where(
          (reel) =>
              reel.postType == PostType.reel || reel.postType == PostType.video,
        )
        .toList(),
  );
}

@Riverpod(keepAlive: true)
FakeReelsRepository fakeReelsRepository(Ref ref) {
  return FakeReelsRepository();
}

@riverpod
Stream<List<MediaPost>> streamReels(Ref ref) {
  return ref.watch(fakeReelsRepositoryProvider).watchReels();
}
