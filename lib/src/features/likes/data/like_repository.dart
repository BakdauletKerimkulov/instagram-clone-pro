import 'package:instagram_clone_pro/src/features/likes/domain/like.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'like_repository.g.dart';

abstract class LikeRepository {
  Future<int> fetchLikeCount(String parentId);
  Stream<int> watchLikeCount(String parentId);

  Future<void> toggleLike(String parentId, Like like);
  Stream<bool> isLikedByUser(String parentId, String userId);
}

@Riverpod(keepAlive: true)
LikeRepository likeRepository(Ref ref) => throw UnimplementedError();
