// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_reels_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(fakeReelsRepository)
const fakeReelsRepositoryProvider = FakeReelsRepositoryProvider._();

final class FakeReelsRepositoryProvider
    extends
        $FunctionalProvider<
          FakeReelsRepository,
          FakeReelsRepository,
          FakeReelsRepository
        >
    with $Provider<FakeReelsRepository> {
  const FakeReelsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fakeReelsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fakeReelsRepositoryHash();

  @$internal
  @override
  $ProviderElement<FakeReelsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FakeReelsRepository create(Ref ref) {
    return fakeReelsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FakeReelsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FakeReelsRepository>(value),
    );
  }
}

String _$fakeReelsRepositoryHash() =>
    r'87d0aca7c1c57ed9e9282e7f7195291f366f4e1a';

@ProviderFor(streamReels)
const streamReelsProvider = StreamReelsProvider._();

final class StreamReelsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MediaPost>>,
          List<MediaPost>,
          Stream<List<MediaPost>>
        >
    with $FutureModifier<List<MediaPost>>, $StreamProvider<List<MediaPost>> {
  const StreamReelsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'streamReelsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$streamReelsHash();

  @$internal
  @override
  $StreamProviderElement<List<MediaPost>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<MediaPost>> create(Ref ref) {
    return streamReels(ref);
  }
}

String _$streamReelsHash() => r'3ae2565694e1956f8532279406f322797cc5430b';
