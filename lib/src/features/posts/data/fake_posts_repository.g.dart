// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fake_posts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(postsListStream)
const postsListStreamProvider = PostsListStreamProvider._();

final class PostsListStreamProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<MediaPost>>,
          List<MediaPost>,
          Stream<List<MediaPost>>
        >
    with $FutureModifier<List<MediaPost>>, $StreamProvider<List<MediaPost>> {
  const PostsListStreamProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'postsListStreamProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$postsListStreamHash();

  @$internal
  @override
  $StreamProviderElement<List<MediaPost>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<MediaPost>> create(Ref ref) {
    return postsListStream(ref);
  }
}

String _$postsListStreamHash() => r'6f892b6b2f7516dc181f98c262eb10b0df187175';

@ProviderFor(fakePostRepository)
const fakePostRepositoryProvider = FakePostRepositoryProvider._();

final class FakePostRepositoryProvider
    extends
        $FunctionalProvider<
          FakePostsRepository,
          FakePostsRepository,
          FakePostsRepository
        >
    with $Provider<FakePostsRepository> {
  const FakePostRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'fakePostRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$fakePostRepositoryHash();

  @$internal
  @override
  $ProviderElement<FakePostsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  FakePostsRepository create(Ref ref) {
    return fakePostRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(FakePostsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<FakePostsRepository>(value),
    );
  }
}

String _$fakePostRepositoryHash() =>
    r'c2a1c965139681785b397dc6a4e77bb01c560d67';
