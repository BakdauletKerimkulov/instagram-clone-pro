import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone_pro/src/constants/test_comments.dart';
import 'package:instagram_clone_pro/src/exceptions/app_exceptions.dart';
import 'package:instagram_clone_pro/src/features/comments/data/comment_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/data/fake_comment_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';

void main() {
  CommentRepository makeCommentRepository() => FakeCommentRepository();

  group('fakeCommentRepository test', () {
    final repo = makeCommentRepository();
    test('fetchCommentsList returns global comments', () async {});

    test('fetchCommentsList throw exception', () async {
      expect(await repo.fetchCommentList('wrong-key'), kTestComments);
    });

    test('deleteCommentsByParentId is succeed', () async {
      await repo.setComments(testParentId, kTestComments);

      await repo.deleteCommentsByParentId(testParentId);

      expect(await repo.fetchCommentList(testParentId), Comments());
    });

    test('deleteCommentsByParentId throws exception', () {
      expect(
        repo.deleteCommentsByParentId('unknown_id'),
        throwsA(isA<Exception>()),
      );
    });

    test('setComments and then get comments', () async {
      await repo.setComments(testParentId, kTestComments);

      expect(await repo.fetchCommentList(testParentId), kTestComments);
    });
  });

  group('checkKeyExists', () {
    final repo = makeCommentRepository();
    test('returns true for existing key', () async {
      expect(await repo.checkKeyExists(testParentId), isTrue);
    });

    test('returns false for non-existing key', () async {
      expect(await repo.checkKeyExists('wrong-key'), isFalse);
    });
  });

  group('watchCommentsList emits initial and updated comments', () {
    final repo = makeCommentRepository();
    test('watchCommentList returns global list', () {
      expect(repo.watchCommentList(testParentId), emits(kTestComments));
    });

    test('watchCommentList returns null', () {
      expect(
        () => repo.watchCommentList('wrong-key'),
        throwsA(isA<AppExceptionSealed>()),
      );
    });
  });
}
