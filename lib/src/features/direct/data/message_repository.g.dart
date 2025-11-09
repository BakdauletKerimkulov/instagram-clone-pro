// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(messageRepository)
const messageRepositoryProvider = MessageRepositoryProvider._();

final class MessageRepositoryProvider
    extends
        $FunctionalProvider<
          MessageRepository,
          MessageRepository,
          MessageRepository
        >
    with $Provider<MessageRepository> {
  const MessageRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'messageRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$messageRepositoryHash();

  @$internal
  @override
  $ProviderElement<MessageRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  MessageRepository create(Ref ref) {
    return messageRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MessageRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MessageRepository>(value),
    );
  }
}

String _$messageRepositoryHash() => r'0b989833cd681d189306a4f140bfd018719685c2';

@ProviderFor(listMessageStream)
const listMessageStreamProvider = ListMessageStreamFamily._();

final class ListMessageStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<Message>>,
          List<Message>,
          Stream<List<Message>>
        >
    with $FutureModifier<List<Message>>, $StreamProvider<List<Message>> {
  const ListMessageStreamProvider._({
    required ListMessageStreamFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'listMessageStreamProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$listMessageStreamHash();

  @override
  String toString() {
    return r'listMessageStreamProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<Message>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<Message>> create(Ref ref) {
    final argument = this.argument as String;
    return listMessageStream(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is ListMessageStreamProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$listMessageStreamHash() => r'ea2a517e580f8e833da2bc51168d061d6c2c7252';

final class ListMessageStreamFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<Message>>, String> {
  const ListMessageStreamFamily._()
    : super(
        retry: null,
        name: r'listMessageStreamProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ListMessageStreamProvider call(String chatId) =>
      ListMessageStreamProvider._(argument: chatId, from: this);

  @override
  String toString() => r'listMessageStreamProvider';
}
