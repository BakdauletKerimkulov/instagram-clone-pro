// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_posts_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gridPostsRepository)
const gridPostsRepositoryProvider = GridPostsRepositoryProvider._();

final class GridPostsRepositoryProvider
    extends
        $FunctionalProvider<
          GridPostsRepository,
          GridPostsRepository,
          GridPostsRepository
        >
    with $Provider<GridPostsRepository> {
  const GridPostsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gridPostsRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gridPostsRepositoryHash();

  @$internal
  @override
  $ProviderElement<GridPostsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  GridPostsRepository create(Ref ref) {
    return gridPostsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GridPostsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GridPostsRepository>(value),
    );
  }
}

String _$gridPostsRepositoryHash() =>
    r'40bcc4e6e05c372b2a9c08f39a1b91d92a289199';
