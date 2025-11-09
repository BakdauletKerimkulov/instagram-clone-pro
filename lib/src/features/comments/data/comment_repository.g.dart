// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comment_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commentRepository)
const commentRepositoryProvider = CommentRepositoryProvider._();

final class CommentRepositoryProvider
    extends
        $FunctionalProvider<
          CommentRepository,
          CommentRepository,
          CommentRepository
        >
    with $Provider<CommentRepository> {
  const CommentRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentRepositoryProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentRepositoryHash();

  @$internal
  @override
  $ProviderElement<CommentRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  CommentRepository create(Ref ref) {
    return commentRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentRepository>(value),
    );
  }
}

String _$commentRepositoryHash() => r'631cd72ccc2abbb720a2e2378e6be26dee89d1d3';
