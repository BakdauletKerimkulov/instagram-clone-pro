// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(likeRepository)
const likeRepositoryProvider = LikeRepositoryProvider._();

final class LikeRepositoryProvider
    extends $FunctionalProvider<LikeRepository, LikeRepository, LikeRepository>
    with $Provider<LikeRepository> {
  const LikeRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'likeRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$likeRepositoryHash();

  @$internal
  @override
  $ProviderElement<LikeRepository> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  LikeRepository create(Ref ref) {
    return likeRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(LikeRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<LikeRepository>(value),
    );
  }
}

String _$likeRepositoryHash() => r'1bb97de2b565a52cd5b939314c58e565c5d2b343';
