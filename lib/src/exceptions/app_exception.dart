// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

part 'app_exception.freezed.dart';

@freezed
class AppException with _$AppException {
  // Auth
  const factory AppException.emailAlreadyInUse() = EmailInAlredyInUse;
  const factory AppException.weakPassword() = WeakPassword;
  const factory AppException.wrongPassword() = WrongPassword;
  const factory AppException.userNotFound() = UserNotFound;
}

class AppExceptionData {
  AppExceptionData(this.code, this.message);
  final String code;
  final String message;

  @override
  String toString() => 'AppExceptionData(code: $code, message: $message)';
}

extension AppExceptionDetails on AppException {
  AppExceptionData get detais {
    return when(
      emailAlreadyInUse: () => AppExceptionData(
        'email-already-in-use',
        'Email already in use'.hardcoded,
      ),
      weakPassword: () =>
          AppExceptionData('weak-password', 'Password is too weak'.hardcoded),
      wrongPassword: () =>
          AppExceptionData('wrong-password', 'Wrong password'.hardcoded),
      userNotFound: () =>
          AppExceptionData('user-not-found', 'User not found'.hardcoded),
    );
  }
}
