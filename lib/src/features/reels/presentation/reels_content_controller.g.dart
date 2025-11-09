// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reels_content_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CurrentReelIndex)
const currentReelIndexProvider = CurrentReelIndexProvider._();

final class CurrentReelIndexProvider
    extends $NotifierProvider<CurrentReelIndex, int> {
  const CurrentReelIndexProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentReelIndexProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentReelIndexHash();

  @$internal
  @override
  CurrentReelIndex create() => CurrentReelIndex();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$currentReelIndexHash() => r'd70276f5b4933d4c89afad1cf2cb7c8981687bde';

abstract class _$CurrentReelIndex extends $Notifier<int> {
  int build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<int, int>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<int, int>,
              int,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
