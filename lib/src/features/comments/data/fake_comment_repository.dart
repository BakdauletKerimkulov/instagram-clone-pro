import 'package:instagram_clone_pro/src/constants/test_comments.dart';
import 'package:instagram_clone_pro/src/exceptions/app_exceptions.dart';
import 'package:instagram_clone_pro/src/features/comments/data/comment_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';
import 'package:instagram_clone_pro/src/utils/in_memory_store.dart';

const testParentId = 'post_123';
const testCommentId = 'comment_123';

class FakeCommentRepository implements CommentRepository {
  final _comments = InMemoryStore<Comments>(kTestComments);

  @override
  Future<bool> checkKeyExists(String key) {
    if (key == testParentId) {
      return Future.value(true);
    } else {
      return Future.value(false);
    }
  }

  @override
  Future<void> deleteCommentsByParentId(String parentId) async {
    if (parentId == testParentId) {
      _comments.value = const Comments();
    } else {
      throw Exception();
    }
  }

  @override
  Future<Comments> fetchCommentList(String parentId) =>
      Future.value(_comments.value);

  @override
  Future<void> setComments(String parentId, Comments comments) async {
    _comments.value = comments;
  }

  @override
  Stream<Comments> watchCommentList(String parentId) {
    return _checkKey(parentId)
        ? _comments.stream
        : throw WrongParentIdException();
  }

  bool _checkKey(String parentId) => parentId == testParentId;
}
