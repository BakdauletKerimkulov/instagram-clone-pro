import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comments.dart';

final kTestCommentsList = [
  Comment(
    id: '1',
    userId: 'user1',
    text: 'Hello world',
    likeCount: 200,
    createdAt: DateTime(2025, 1, 10, 14, 30),
  ),
  Comment(
    id: '2',
    userId: 'user2',
    text: 'Flutter is awesome',
    likeCount: 100,
    createdAt: DateTime(2025, 2, 15, 9, 45),
  ),
  Comment(
    id: '3',
    userId: 'user3',
    text: 'Riverpod state management',
    likeCount: 156,
    createdAt: DateTime(2025, 3, 22, 16, 10),
  ),
  Comment(
    id: '4',
    userId: 'user4',
    text: 'Learning Dart today',
    likeCount: 546,
    createdAt: DateTime(2025, 4, 1, 19, 20),
  ),
  Comment(
    id: '5',
    userId: 'user5',
    text: 'This app is cool',
    likeCount: 122,
    createdAt: DateTime(2025, 4, 18, 11, 50),
  ),
  Comment(
    id: '6',
    userId: 'user6',
    text: 'Write clean Flutter code',
    likeCount: 54,
    createdAt: DateTime(2025, 5, 9, 8, 25),
  ),
  Comment(
    id: '7',
    userId: 'user7',
    text: 'Unit tests are important',
    likeCount: 12,
    createdAt: DateTime(2025, 6, 5, 13, 40),
  ),
  Comment(
    id: '8',
    userId: 'user8',
    text: 'Working on a project',
    likeCount: 46,
    createdAt: DateTime(2025, 7, 2, 17, 55),
  ),
  Comment(
    id: '9',
    userId: 'user9',
    text: 'Keep coding every day',
    likeCount: 216,
    createdAt: DateTime(2025, 8, 25, 10, 15),
  ),
];

// Преобразование списка в Map для Comments
final kTestCommentsMap = Map<CommentID, Comment>.fromEntries(
  kTestCommentsList.map((comment) => MapEntry(comment.id, comment)),
);

// Тестовый объекто Comments
final kTestComments = Comments(kTestCommentsMap);
