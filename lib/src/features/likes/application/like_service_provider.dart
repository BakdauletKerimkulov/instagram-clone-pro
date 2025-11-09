import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/likes/data/like_repository.dart';
import 'package:instagram_clone_pro/src/features/likes/domain/like.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_service_provider.g.dart';

@Riverpod(keepAlive: true)
Stream<bool> isLikedByUser(Ref ref, String parentId) {
  final user = ref.watch(authStateChangesProvider).value;

  if (user != null) {
    return ref.watch(likeRepositoryProvider).isLikedByUser(parentId, user.uid);
  } else {
    return Stream.value(false);
  }
}

@Riverpod(keepAlive: true)
class ToggleLikeController extends _$ToggleLikeController {
  @override
  FutureOr<void> build() {
    // nothing to do
  }

  Future<void> toggleLike(String parentId, Like like) async {
    final likeRepository = ref.read(likeRepositoryProvider);
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => likeRepository.toggleLike(parentId, like),
    );
  }
}
