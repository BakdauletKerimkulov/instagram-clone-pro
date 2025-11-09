// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'like_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(isLikedByUser)
const isLikedByUserProvider = IsLikedByUserFamily._();

final class IsLikedByUserProvider
    extends $FunctionalProvider<AsyncValue<bool>, bool, Stream<bool>>
    with $FutureModifier<bool>, $StreamProvider<bool> {
  const IsLikedByUserProvider._({
    required IsLikedByUserFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'isLikedByUserProvider',
         isAutoDispose: false,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$isLikedByUserHash();

  @override
  String toString() {
    return r'isLikedByUserProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $StreamProviderElement<bool> $createElement($ProviderPointer pointer) =>
      $StreamProviderElement(pointer);

  @override
  Stream<bool> create(Ref ref) {
    final argument = this.argument as String;
    return isLikedByUser(ref, argument);
  }

  @override
  bool operator ==(Object other) {
    return other is IsLikedByUserProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$isLikedByUserHash() => r'db62b96cbe28d6c7de91578da7ac8a4794878090';

final class IsLikedByUserFamily extends $Family
    with $FunctionalFamilyOverride<Stream<bool>, String> {
  const IsLikedByUserFamily._()
    : super(
        retry: null,
        name: r'isLikedByUserProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: false,
      );

  IsLikedByUserProvider call(String parentId) =>
      IsLikedByUserProvider._(argument: parentId, from: this);

  @override
  String toString() => r'isLikedByUserProvider';
}

@ProviderFor(ToggleLikeController)
const toggleLikeControllerProvider = ToggleLikeControllerProvider._();

final class ToggleLikeControllerProvider
    extends $AsyncNotifierProvider<ToggleLikeController, void> {
  const ToggleLikeControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toggleLikeControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toggleLikeControllerHash();

  @$internal
  @override
  ToggleLikeController create() => ToggleLikeController();
}

String _$toggleLikeControllerHash() =>
    r'8784936bf7e15ea1da50cde7b954e7c5f708bc3d';

abstract class _$ToggleLikeController extends $AsyncNotifier<void> {
  FutureOr<void> build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<AsyncValue<void>, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<void>, void>,
              AsyncValue<void>,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}
