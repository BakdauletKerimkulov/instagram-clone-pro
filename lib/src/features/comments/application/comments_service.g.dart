// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(commentsService)
const commentsServiceProvider = CommentsServiceProvider._();

final class CommentsServiceProvider
    extends
        $FunctionalProvider<CommentsService, CommentsService, CommentsService>
    with $Provider<CommentsService> {
  const CommentsServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'commentsServiceProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$commentsServiceHash();

  @$internal
  @override
  $ProviderElement<CommentsService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  CommentsService create(Ref ref) {
    return commentsService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CommentsService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CommentsService>(value),
    );
  }
}

String _$commentsServiceHash() => r'ba60d78a085a554f1e1485c0d5ff815e94fc86c7';

@ProviderFor(comments)
const commentsProvider = CommentsFamily._();

final class CommentsProvider
    extends
        $FunctionalProvider<AsyncValue<Comments>, Comments, Stream<Comments>>
    with $FutureModifier<Comments>, $StreamProvider<Comments> {
  const CommentsProvider._({
    required CommentsFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentsProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentsHash();

  @override
  String toString() {
    return r'commentsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<Comments> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<Comments> create(Ref ref) {
    final argument = this.argument as String;
    return comments(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentsProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentsHash() => r'9bb9153b8116202aadb9e05279677fa9d88d59b7';

final class CommentsFamily extends $Family
    with $FunctionalFamilyOverride<Stream<Comments>, String> {
  const CommentsFamily._()
    : super(
        retry: null,
        name: r'commentsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CommentsProvider call(String parentId) =>
      CommentsProvider._(argument: parentId, from: this);

  @override
  String toString() => r'commentsProvider';
}

@ProviderFor(commentWithUser)
const commentWithUserProvider = CommentWithUserFamily._();

final class CommentWithUserProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<CommentWithUser>>,
          List<CommentWithUser>,
          Stream<List<CommentWithUser>>
        >
    with
        $FutureModifier<List<CommentWithUser>>,
        $StreamProvider<List<CommentWithUser>> {
  const CommentWithUserProvider._({
    required CommentWithUserFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentWithUserProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentWithUserHash();

  @override
  String toString() {
    return r'commentWithUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<List<CommentWithUser>> $createElement(
    $ProviderPointer pointer,
  ) => $StreamProviderElement(pointer);

  @override
  Stream<List<CommentWithUser>> create(Ref ref) {
    final argument = this.argument as String;
    return commentWithUser(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is CommentWithUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentWithUserHash() => r'16ad1dd863ad11da7aaa71e5c00669359c075fc2';

final class CommentWithUserFamily extends $Family
    with $FunctionalFamilyOverride<Stream<List<CommentWithUser>>, String> {
  const CommentWithUserFamily._()
    : super(
        retry: null,
        name: r'commentWithUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  CommentWithUserProvider call(String id) =>
      CommentWithUserProvider._(argument: id, from: this);

  @override
  String toString() => r'commentWithUserProvider';
}

@ProviderFor(commentsCount)
const commentsCountProvider = CommentsCountFamily._();

final class CommentsCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const CommentsCountProvider._({
    required CommentsCountFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'commentsCountProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentsCountHash();

  @override
  String toString() {
    return r'commentsCountProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as String;
    return commentsCount(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentsCountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentsCountHash() => r'37be32031135ad936780c478ea67c3753f872d3e';

final class CommentsCountFamily extends $Family
    with $FunctionalFamilyOverride<int, String> {
  const CommentsCountFamily._()
    : super(
        retry: null,
        name: r'commentsCountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CommentsCountProvider call(String parentId) =>
      CommentsCountProvider._(argument: parentId, from: this);

  @override
  String toString() => r'commentsCountProvider';
}

@ProviderFor(commentLikeCount)
const commentLikeCountProvider = CommentLikeCountFamily._();

final class CommentLikeCountProvider extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const CommentLikeCountProvider._({
    required CommentLikeCountFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'commentLikeCountProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentLikeCountHash();

  @override
  String toString() {
    return r'commentLikeCountProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    final argument = this.argument as (String, String);
    return commentLikeCount(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentLikeCountProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentLikeCountHash() => r'245723f11cd5aa91c61907dc9ffcf170bbfd9ff9';

final class CommentLikeCountFamily extends $Family
    with $FunctionalFamilyOverride<int, (String, String)> {
  const CommentLikeCountFamily._()
    : super(
        retry: null,
        name: r'commentLikeCountProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CommentLikeCountProvider call(String parentId, String commentId) =>
      CommentLikeCountProvider._(argument: (parentId, commentId), from: this);

  @override
  String toString() => r'commentLikeCountProvider';
}

@ProviderFor(commentIsLiked)
const commentIsLikedProvider = CommentIsLikedFamily._();

final class CommentIsLikedProvider extends $FunctionalProvider<bool, bool, bool>
    with $Provider<bool> {
  const CommentIsLikedProvider._({
    required CommentIsLikedFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'commentIsLikedProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$commentIsLikedHash();

  @override
  String toString() {
    return r'commentIsLikedProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  $ProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  bool create(Ref ref) {
    final argument = this.argument as (String, String);
    return commentIsLiked(ref, argument.$1, argument.$2);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CommentIsLikedProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$commentIsLikedHash() => r'7fee850b64ec6cdf365ac99cff6f639b653686cb';

final class CommentIsLikedFamily extends $Family
    with $FunctionalFamilyOverride<bool, (String, String)> {
  const CommentIsLikedFamily._()
    : super(
        retry: null,
        name: r'commentIsLikedProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  CommentIsLikedProvider call(String parentId, String commentId) =>
      CommentIsLikedProvider._(argument: (parentId, commentId), from: this);

  @override
  String toString() => r'commentIsLikedProvider';
}
