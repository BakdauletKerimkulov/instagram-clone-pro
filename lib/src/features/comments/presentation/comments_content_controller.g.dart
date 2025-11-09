// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'comments_content_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(SendCommentController)
const sendCommentControllerProvider = SendCommentControllerProvider._();

final class SendCommentControllerProvider
    extends $AsyncNotifierProvider<SendCommentController, void> {
  const SendCommentControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'sendCommentControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$sendCommentControllerHash();

  @$internal
  @override
  SendCommentController create() => SendCommentController();
}

String _$sendCommentControllerHash() =>
    r'ed36909d36afb24140b00ed9f924d83d15f8eef2';

abstract class _$SendCommentController extends $AsyncNotifier<void> {
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

@ProviderFor(ReplyingToCommentId)
const replyingToCommentIdProvider = ReplyingToCommentIdProvider._();

final class ReplyingToCommentIdProvider
    extends $NotifierProvider<ReplyingToCommentId, String?> {
  const ReplyingToCommentIdProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'replyingToCommentIdProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$replyingToCommentIdHash();

  @$internal
  @override
  ReplyingToCommentId create() => ReplyingToCommentId();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String?>(value),
    );
  }
}

String _$replyingToCommentIdHash() =>
    r'488ee9439987c9b58231b83d1c6045e811d22cba';

abstract class _$ReplyingToCommentId extends $Notifier<String?> {
  String? build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<String?, String?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<String?, String?>,
              String?,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
