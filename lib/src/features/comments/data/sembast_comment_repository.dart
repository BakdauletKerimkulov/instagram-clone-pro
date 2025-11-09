import 'package:instagram_clone_pro/src/features/comments/data/comment_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';
import 'package:instagram_clone_pro/src/utils/database_service.dart';
import 'package:sembast/sembast_io.dart';

class SembastCommentRepository implements CommentRepository {
  SembastCommentRepository(this.dbService);
  final DatabaseService dbService;

  static const String commentsStore = 'comments-store';

  final _store = StoreRef<String, String>(commentsStore);

  @override
  Future<void> setComments(String parentId, Comments comments) {
    return _store.record(parentId).put(dbService.db, comments.toJson());
  }

  @override
  Future<Comments> fetchCommentList(String parentId) async {
    final commentsJson = await _store.record(parentId).get(dbService.db);

    if (commentsJson != null) {
      return Comments.fromJson(commentsJson);
    } else {
      return const Comments();
    }
  }

  @override
  Stream<Comments> watchCommentList(String parentId) {
    final record = _store.record(parentId);
    return record.onSnapshot(dbService.db).map((snapshot) {
      if (snapshot != null) {
        return Comments.fromJson(snapshot.value);
      } else {
        return const Comments();
      }
    });
  }

  @override
  Future<void> deleteCommentsByParentId(String parentId) {
    return _store.record(parentId).delete(dbService.db);
  }

  @override
  Future<bool> checkKeyExists(String key) async {
    return _store.record(key).exists(dbService.db);
  }
}
