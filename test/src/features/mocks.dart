import 'package:instagram_clone_pro/src/features/comments/data/sembast_comment_repository.dart';
import 'package:instagram_clone_pro/src/utils/database_service.dart';
import 'package:mocktail/mocktail.dart';
import 'package:sembast/sembast_io.dart';

class MockCommentsRepository extends Mock implements SembastCommentRepository {}

class MockDatabaseService extends Mock implements DatabaseService {}

class MockDatabase extends Mock implements Database {}
