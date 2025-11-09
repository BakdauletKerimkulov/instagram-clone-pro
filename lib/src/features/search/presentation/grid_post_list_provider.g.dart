// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'grid_post_list_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(gridPostList)
const gridPostListProvider = GridPostListProvider._();

final class GridPostListProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<GridItemPost>>,
          List<GridItemPost>,
          FutureOr<List<GridItemPost>>
        >
    with
        $FutureModifier<List<GridItemPost>>,
        $FutureProvider<List<GridItemPost>> {
  const GridPostListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'gridPostListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$gridPostListHash();

  @$internal
  @override
  $FutureProviderElement<List<GridItemPost>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<GridItemPost>> create(Ref ref) {
    return gridPostList(ref);
  }
}

String _$gridPostListHash() => r'4cd799eb71fc361ed5ca485c5b69db0a96c1ccce';
