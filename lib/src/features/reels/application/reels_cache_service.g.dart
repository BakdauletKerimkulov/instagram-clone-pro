// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_cache_service.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ReelsCacheService)
const reelsCacheServiceProvider = ReelsCacheServiceProvider._();

final class ReelsCacheServiceProvider
    extends $NotifierProvider<ReelsCacheService, void> {
  const ReelsCacheServiceProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'reelsCacheServiceProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$reelsCacheServiceHash();

  @$internal
  @override
  ReelsCacheService create() => ReelsCacheService();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(void value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<void>(value),
    );
  }
}

String _$reelsCacheServiceHash() => r'5de1a3fb965fddb98875523bfcab24c5c472fecd';

abstract class _$ReelsCacheService extends $Notifier<void> {
  void build();
  @$mustCallSuper
  @override
  void runBuild() {
    build();
    final ref = this.ref as $Ref<void, void>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<void, void>,
              void,
              Object?,
              Object?
            >;
    element.handleValue(ref, null);
  }
}

@ProviderFor(getController)
const getControllerProvider = GetControllerFamily._();

final class GetControllerProvider
    extends
        $FunctionalProvider<
          VideoPlayerController?,
          VideoPlayerController?,
          VideoPlayerController?
        >
    with $Provider<VideoPlayerController?> {
  const GetControllerProvider._({
    required GetControllerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'getControllerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$getControllerHash();

  @override
  String toString() {
    return r'getControllerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<VideoPlayerController?> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  VideoPlayerController? create(Ref ref) {
    final argument = this.argument as String;
    return getController(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(VideoPlayerController? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<VideoPlayerController?>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is GetControllerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$getControllerHash() => r'ae5d8b24b77bdac4345793c9c9b6af7a97005820';

final class GetControllerFamily extends $Family
    with $FunctionalFamilyOverride<VideoPlayerController?, String> {
  const GetControllerFamily._()
    : super(
        retry: null,
        name: r'getControllerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  GetControllerProvider call(String id) =>
      GetControllerProvider._(argument: id, from: this);

  @override
  String toString() => r'getControllerProvider';
}
