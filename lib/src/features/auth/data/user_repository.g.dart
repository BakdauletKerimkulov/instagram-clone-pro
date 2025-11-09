// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(userRepository)
const userRepositoryProvider = UserRepositoryProvider._();

final class UserRepositoryProvider
    extends $FunctionalProvider<UserRepository, UserRepository, UserRepository>
    with $Provider<UserRepository> {
  const UserRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'userRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$userRepositoryHash();

  @$internal
  @override
  $ProviderElement<UserRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  UserRepository create(Ref ref) {
    return userRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(UserRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<UserRepository>(value),
    );
  }
}

String _$userRepositoryHash() => r'e0c89d132654583a33838ee0c91b40a43b93f89f';

@ProviderFor(fetchUser)
const fetchUserProvider = FetchUserFamily._();

final class FetchUserProvider
    extends
        $FunctionalProvider<AsyncValue<AppUser?>, AppUser?, FutureOr<AppUser?>>
    with $FutureModifier<AppUser?>, $FutureProvider<AppUser?> {
  const FetchUserProvider._({
    required FetchUserFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchUserHash();

  @override
  String toString() {
    return r'fetchUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<AppUser?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<AppUser?> create(Ref ref) {
    final argument = this.argument as String;
    return fetchUser(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchUserHash() => r'29d3761d9a03039032eedb3a0aa584e31767ff75';

final class FetchUserFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<AppUser?>, String> {
  const FetchUserFamily._()
    : super(
        retry: null,
        name: r'fetchUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchUserProvider call(String id) =>
      FetchUserProvider._(argument: id, from: this);

  @override
  String toString() => r'fetchUserProvider';
}

@ProviderFor(userList)
const userListProvider = UserListFamily._();

final class UserListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AppUser>>,
          List<AppUser>,
          FutureOr<List<AppUser>>
        >
    with $FutureModifier<List<AppUser>>, $FutureProvider<List<AppUser>> {
  const UserListProvider._({
    required UserListFamily super.from,
    required List<String> super.argument,
  }) : super(
         retry: null,
         name: r'userListProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$userListHash();

  @override
  String toString() {
    return r'userListProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<List<AppUser>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<AppUser>> create(Ref ref) {
    final argument = this.argument as List<String>;
    return userList(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is UserListProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$userListHash() => r'5ee6a692de33555d1705fdd059499205426c1017';

final class UserListFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<List<AppUser>>, List<String>> {
  const UserListFamily._()
    : super(
        retry: null,
        name: r'userListProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  UserListProvider call(List<String> ids) =>
      UserListProvider._(argument: ids, from: this);

  @override
  String toString() => r'userListProvider';
}

@ProviderFor(findUserByUsername)
const findUserByUsernameProvider = FindUserByUsernameFamily._();

final class FindUserByUsernameProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<AppUser>>,
          List<AppUser>,
          Stream<List<AppUser>>
        >
    with $FutureModifier<List<AppUser>>, $StreamProvider<List<AppUser>> {
  const FindUserByUsernameProvider._({
    required FindUserByUsernameFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'findUserByUsernameProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$findUserByUsernameHash();

  @override
  String toString() {
    return r'findUserByUsernameProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<AppUser>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<AppUser>> create(Ref ref) {
    final argument = this.argument as String;
    return findUserByUsername(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FindUserByUsernameProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$findUserByUsernameHash() =>
    r'7d17946bffb0c01a6823db0c38dc3be4033ad45a';

final class FindUserByUsernameFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<AppUser>>, String> {
  const FindUserByUsernameFamily._()
    : super(
        retry: null,
        name: r'findUserByUsernameProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FindUserByUsernameProvider call(String username) =>
      FindUserByUsernameProvider._(argument: username, from: this);

  @override
  String toString() => r'findUserByUsernameProvider';
}
