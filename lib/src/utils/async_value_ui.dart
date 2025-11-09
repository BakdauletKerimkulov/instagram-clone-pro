import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/alert_dialogs.dart';
import 'package:instagram_clone_pro/src/exceptions/app_exception.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:instagram_clone_pro/src/routing/app_router.dart';

extension AsyncValueUI on AsyncValue {
  void showAlertDialogOnError(BuildContext context) {
    if (!isLoading && hasError) {
      final message = _errorMessage(error);
      showExceptionAlertDialog(
        context: context,
        title: 'Error'.hardcoded,
        exception: message,
      );
    }
  }

  String _errorMessage(Object? error) {
    if (error is AppException) {
      return error.detais.message;
    } else {
      return error.toString();
    }
  }
}

void showGlobalErrorDialog(String message) {
  final context = rootNavigatorKey.currentContext;

  if (context != null) {
    showDialog(
      // Используем контекст, полученный из роутера
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Произошла ошибка'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }
}
