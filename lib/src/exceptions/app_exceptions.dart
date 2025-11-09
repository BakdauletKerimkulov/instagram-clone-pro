import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

sealed class AppExceptionSealed implements Exception {
  AppExceptionSealed(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => message;
}

class WrongPasswordException extends AppExceptionSealed {
  WrongPasswordException()
    : super('wrong-password', 'Wrong password'.hardcoded);
}

class UserNotFoundException extends AppExceptionSealed {
  UserNotFoundException() : super('user-not-found', 'User not found'.hardcoded);
}

class EmailAlreadyInUseException extends AppExceptionSealed {
  EmailAlreadyInUseException()
    : super('email-already-exists', 'Email already exists'.hardcoded);
}

class WeakPasswordException extends AppExceptionSealed {
  WeakPasswordException()
    : super('weak-password', 'Password is too weak'.hardcoded);
}

class DatabaseNotInitializedException extends AppExceptionSealed {
  DatabaseNotInitializedException()
    : super('database-not-initialized', 'Database not initialized');
}

class WrongParentIdException extends AppExceptionSealed {
  WrongParentIdException() : super('wrong-parent-id', 'wrong parent ID');
}
