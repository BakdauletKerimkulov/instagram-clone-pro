import 'package:flutter/foundation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'error_logger.g.dart';

class ErrorLogger {
  void logError(Object error, StackTrace? stackTrace) {
    debugPrint('$error, $stackTrace');
  }
}

@riverpod
ErrorLogger errorLogger(Ref ref) => ErrorLogger();
