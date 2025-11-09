// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mute_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(MuteController)
const muteControllerProvider = MuteControllerProvider._();

final class MuteControllerProvider
    extends $NotifierProvider<MuteController, bool> {
  const MuteControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'muteControllerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$muteControllerHash();

  @$internal
  @override
  MuteController create() => MuteController();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(bool value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<bool>(value),
    );
  }
}

String _$muteControllerHash() => r'93524b4838e12e1b1a245e6013d6a0c8803aa0d8';

abstract class _$MuteController extends $Notifier<bool> {
  bool build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<bool, bool>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<bool, bool>,
              bool,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
