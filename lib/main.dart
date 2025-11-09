import 'dart:ui';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/firebase_options.dart';
import 'package:instagram_clone_pro/src/app.dart';
import 'package:instagram_clone_pro/src/exceptions/async_error_logger.dart';
import 'package:instagram_clone_pro/src/exceptions/error_logger.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_user_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/data/comment_repository.dart';
import 'package:instagram_clone_pro/src/features/comments/data/sembast_comment_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/data/message_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/data/sembast_message_repostiory.dart';
import 'package:instagram_clone_pro/src/features/likes/data/like_repository.dart';
import 'package:instagram_clone_pro/src/features/likes/data/sembast_like_repository.dart';
import 'package:instagram_clone_pro/src/features/search/data/fake_grid_posts_repoitory.dart';
import 'package:instagram_clone_pro/src/features/search/data/grid_posts_repository.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:instagram_clone_pro/src/utils/async_value_ui.dart';
import 'package:instagram_clone_pro/src/utils/database_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  final localDbService = await DatabaseService.makeDefault();

  final commentRepo = SembastCommentRepository(localDbService);

  final likeRepo = SembastLikeRepository(localDbService);

  final gridPostsRepository = FakeGridPostsRepoitory();

  final userRepository = FakeUserRepository();

  final messageRepo = SembastMessageRepostiory(localDbService);

  final container = ProviderContainer(
    overrides: [
      commentRepositoryProvider.overrideWithValue(commentRepo),
      userRepositoryProvider.overrideWithValue(userRepository),
      gridPostsRepositoryProvider.overrideWithValue(gridPostsRepository),
      likeRepositoryProvider.overrideWithValue(likeRepo),
      messageRepositoryProvider.overrideWithValue(messageRepo),
    ],
    observers: [AsyncErrorLogger()],
  );

  final errorLogger = container.read(errorLoggerProvider);
  registerErrorHandlers(errorLogger);

  runApp(UncontrolledProviderScope(container: container, child: const MyApp()));
}

void registerErrorHandlers(ErrorLogger errorLogger) {
  // * Show some error UI if any uncaught exception happens
  FlutterError.onError = (FlutterErrorDetails details) {
    FlutterError.presentError(details);
    errorLogger.logError(details.exception, details.stack);
    showGlobalErrorDialog(details.exception.toString());
  };

  // * Handle error from the underlying platform/OS
  PlatformDispatcher.instance.onError = (Object error, StackTrace stack) {
    errorLogger.logError(error, stack);
    showGlobalErrorDialog(error.toString());
    return true;
  };

  ErrorWidget.builder = (FlutterErrorDetails details) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text('An error occured'.hardcoded),
      ),
      body: Center(child: Text(details.toString())),
    );
  };
}
