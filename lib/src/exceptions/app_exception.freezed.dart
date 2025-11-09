// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'app_exception.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AppException {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AppException);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException()';
}


}

/// @nodoc
class $AppExceptionCopyWith<$Res>  {
$AppExceptionCopyWith(AppException _, $Res Function(AppException) __);
}


/// Adds pattern-matching-related methods to [AppException].
extension AppExceptionPatterns on AppException {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( EmailInAlredyInUse value)?  emailAlreadyInUse,TResult Function( WeakPassword value)?  weakPassword,TResult Function( WrongPassword value)?  wrongPassword,TResult Function( UserNotFound value)?  userNotFound,required TResult orElse(),}){
final _that = this;
switch (_that) {
case EmailInAlredyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse(_that);case WeakPassword() when weakPassword != null:
return weakPassword(_that);case WrongPassword() when wrongPassword != null:
return wrongPassword(_that);case UserNotFound() when userNotFound != null:
return userNotFound(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( EmailInAlredyInUse value)  emailAlreadyInUse,required TResult Function( WeakPassword value)  weakPassword,required TResult Function( WrongPassword value)  wrongPassword,required TResult Function( UserNotFound value)  userNotFound,}){
final _that = this;
switch (_that) {
case EmailInAlredyInUse():
return emailAlreadyInUse(_that);case WeakPassword():
return weakPassword(_that);case WrongPassword():
return wrongPassword(_that);case UserNotFound():
return userNotFound(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( EmailInAlredyInUse value)?  emailAlreadyInUse,TResult? Function( WeakPassword value)?  weakPassword,TResult? Function( WrongPassword value)?  wrongPassword,TResult? Function( UserNotFound value)?  userNotFound,}){
final _that = this;
switch (_that) {
case EmailInAlredyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse(_that);case WeakPassword() when weakPassword != null:
return weakPassword(_that);case WrongPassword() when wrongPassword != null:
return wrongPassword(_that);case UserNotFound() when userNotFound != null:
return userNotFound(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function()?  emailAlreadyInUse,TResult Function()?  weakPassword,TResult Function()?  wrongPassword,TResult Function()?  userNotFound,required TResult orElse(),}) {final _that = this;
switch (_that) {
case EmailInAlredyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse();case WeakPassword() when weakPassword != null:
return weakPassword();case WrongPassword() when wrongPassword != null:
return wrongPassword();case UserNotFound() when userNotFound != null:
return userNotFound();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function()  emailAlreadyInUse,required TResult Function()  weakPassword,required TResult Function()  wrongPassword,required TResult Function()  userNotFound,}) {final _that = this;
switch (_that) {
case EmailInAlredyInUse():
return emailAlreadyInUse();case WeakPassword():
return weakPassword();case WrongPassword():
return wrongPassword();case UserNotFound():
return userNotFound();case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function()?  emailAlreadyInUse,TResult? Function()?  weakPassword,TResult? Function()?  wrongPassword,TResult? Function()?  userNotFound,}) {final _that = this;
switch (_that) {
case EmailInAlredyInUse() when emailAlreadyInUse != null:
return emailAlreadyInUse();case WeakPassword() when weakPassword != null:
return weakPassword();case WrongPassword() when wrongPassword != null:
return wrongPassword();case UserNotFound() when userNotFound != null:
return userNotFound();case _:
  return null;

}
}

}

/// @nodoc


class EmailInAlredyInUse implements AppException {
  const EmailInAlredyInUse();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is EmailInAlredyInUse);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.emailAlreadyInUse()';
}


}




/// @nodoc


class WeakPassword implements AppException {
  const WeakPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WeakPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.weakPassword()';
}


}




/// @nodoc


class WrongPassword implements AppException {
  const WrongPassword();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is WrongPassword);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.wrongPassword()';
}


}




/// @nodoc


class UserNotFound implements AppException {
  const UserNotFound();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserNotFound);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'AppException.userNotFound()';
}


}




// dart format on
