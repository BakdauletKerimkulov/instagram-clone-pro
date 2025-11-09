// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:instagram_clone_pro/src/features/likes/data/like_repository.dart';
import 'package:instagram_clone_pro/src/features/likes/domain/like.dart';
import 'package:instagram_clone_pro/src/utils/database_service.dart';
import 'package:sembast/sembast_io.dart';

class SembastLikeRepository implements LikeRepository {
  SembastLikeRepository(this.dbService);
  final DatabaseService dbService;

  static const String likesStore = 'likes-store';

  final _store = StoreRef(likesStore);

  @override
  Future<int> fetchLikeCount(String parentId) async {
    final data = await _store.record(parentId).get(dbService.db);
    return (data is List) ? data.length : 0;
  }

  @override
  Future<void> toggleLike(String parentId, Like like) async {
    final record = _store.record(parentId);

    final existing = await record.get(dbService.db) as List<dynamic>? ?? [];

    final likes = existing
        .map((e) => Like.fromMap(Map<String, dynamic>.from(e)))
        .toList();

    final alreadyLiked = likes.any((l) => l.userId == like.userId);

    if (alreadyLiked) {
      likes.removeWhere((l) => l.userId == like.userId);
    } else {
      likes.add(like);
    }

    await record.put(dbService.db, likes.map((l) => l.toMap()).toList());
  }

  @override
  Stream<int> watchLikeCount(String parentId) {
    final record = _store.record(parentId);
    return record.onSnapshot(dbService.db).map((snapshot) {
      if (snapshot?.value != null) {
        final likes = snapshot!.value as List<dynamic>;
        return likes.length;
      } else {
        return 0;
      }
    });
  }

  @override
  Stream<bool> isLikedByUser(String parentId, String userId) {
    final record = _store.record(parentId);
    return record.onSnapshot(dbService.db).map((snapshot) {
      if (snapshot?.value != null) {
        final likes = snapshot!.value as List<dynamic>;
        return likes.any((item) {
          final map = item as Map<String, dynamic>;
          return map['userId'] == userId;
        });
      } else {
        return false;
      }
    });
  }
}
