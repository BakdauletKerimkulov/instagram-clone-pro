// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_direct_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fakeDirectRepository)
const fakeDirectRepositoryProvider = FakeDirectRepositoryProvider._();

final class FakeDirectRepositoryProvider
    extends
        $FunctionalProvider<
          FakeDirectRepository,
          FakeDirectRepository,
          FakeDirectRepository
        >
    with $Provider<FakeDirectRepository> {
  const FakeDirectRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fakeDirectRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fakeDirectRepositoryHash();

  @$internal
  @override
  $ProviderElement<FakeDirectRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FakeDirectRepository create(Ref ref) {
    return fakeDirectRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FakeDirectRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FakeDirectRepository>(value),
    );
  }
}

String _$fakeDirectRepositoryHash() =>
    r'129c258b9dd9a592ec09970e03770d7a20d4e1a7';

@ProviderFor(watchChats)
const watchChatsProvider = WatchChatsProvider._();

final class WatchChatsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Chat>>,
          List<Chat>,
          Stream<List<Chat>>
        >
    with $FutureModifier<List<Chat>>, $StreamProvider<List<Chat>> {
  const WatchChatsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'watchChatsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$watchChatsHash();

  @$internal
  @override
  $StreamProviderElement<List<Chat>> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<List<Chat>> create(Ref ref) {
    return watchChats(ref);
  }
}

String _$watchChatsHash() => r'e83a7a4d5c7df6e300739087576dd37f2f96a3d8';

@ProviderFor(fetchChatById)
const fetchChatByIdProvider = FetchChatByIdFamily._();

final class FetchChatByIdProvider
    extends $FunctionalProvider<AsyncValue<Chat?>, Chat?, FutureOr<Chat?>>
    with $FutureModifier<Chat?>, $FutureProvider<Chat?> {
  const FetchChatByIdProvider._({
    required FetchChatByIdFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'fetchChatByIdProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$fetchChatByIdHash();

  @override
  String toString() {
    return r'fetchChatByIdProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $FutureProviderElement<Chat?> $createElement($ProviderPointer pointer) =>
      $FutureProviderElement(pointer);

  @override
  FutureOr<Chat?> create(Ref ref) {
    final argument = this.argument as String;
    return fetchChatById(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchChatByIdProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$fetchChatByIdHash() => r'e737ef5695ff7cfb8bfb4483ae2455ba78d7c844';

final class FetchChatByIdFamily extends $Family
    with $FunctionalFamilyOverride<FutureOr<Chat?>, String> {
  const FetchChatByIdFamily._()
    : super(
        retry: null,
        name: r'fetchChatByIdProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  FetchChatByIdProvider call(String chatId) =>
      FetchChatByIdProvider._(argument: chatId, from: this);

  @override
  String toString() => r'fetchChatByIdProvider';
}

@ProviderFor(chat)
const chatProvider = ChatFamily._();

final class ChatProvider
    extends $FunctionalProvider<AsyncValue<Chat?>, Chat?, Stream<Chat?>>
    with $FutureModifier<Chat?>, $StreamProvider<Chat?> {
  const ChatProvider._({
    required ChatFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'chatProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatHash();

  @override
  String toString() {
    return r'chatProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Chat?> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Chat?> create(Ref ref) {
    final argument = this.argument as String;
    return chat(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ChatProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatHash() => r'de1271a6ee44e8d3cf74d16eeccadb58c91057e5';

final class ChatFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Chat?>, String> {
  const ChatFamily._()
    : super(
        retry: null,
        name: r'chatProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChatProvider call(String chatId) =>
      ChatProvider._(argument: chatId, from: this);

  @override
  String toString() => r'chatProvider';
}
