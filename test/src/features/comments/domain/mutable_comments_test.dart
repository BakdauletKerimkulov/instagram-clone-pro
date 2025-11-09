import 'package:flutter_test/flutter_test.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/mutable_comments.dart';

void main() {
  const testUserId = 'user123';
  const testText = 'hello world';
  final testCreatedAt = DateTime(2025, 1, 10, 14, 30);
  final testComment = Comment(
    id: '1',
    userId: testUserId,
    text: testText,
    likeCount: 0,
    createdAt: testCreatedAt,
  );

  group('mutable comments', () {
    test('empty comments - set testComment', () {
      final comments = const Comments().setItem(testComment);

      expect(comments.items, {'1': testComment});
    });
  });

  group('toggleLike', () {
    test('toggle like', () {
      final comments = const Comments()
          .setItem(testComment)
          .toggleCommentLike('1');

      expect(comments.items, {
        '1': Comment(
          id: '1',
          userId: testUserId,
          text: testText,
          isLiked: true,
          likeCount: 1,
          createdAt: testCreatedAt,
        ),
      });
    });
  });

  group('remove item', () {
    test('empty comments - remove matching item', () {
      final comments = const Comments()
          .setItem(testComment)
          .removeItemById('1');

      expect(comments.items, {});
    });

    test('empty comments - remove item', () {
      final comments = const Comments().removeItemById('1');
      expect(comments.items, {});
    });

    test('empty comments - remove non-matching item', () {
      final comments = const Comments()
          .setItem(testComment)
          .removeItemById('2');
      expect(comments.items, {'1': testComment});
    });
  });
}
