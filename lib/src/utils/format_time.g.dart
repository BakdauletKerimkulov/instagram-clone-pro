// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'format_time.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(formatTime)
const formatTimeProvider = FormatTimeProvider._();

final class FormatTimeProvider
    extends
        $FunctionalProvider<
          String Function(DateTime),
          String Function(DateTime),
          String Function(DateTime)
        >
    with $Provider<String Function(DateTime)> {
  const FormatTimeProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'formatTimeProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$formatTimeHash();

  @$internal
  @override
  $ProviderElement<String Function(DateTime)> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  String Function(DateTime) create(Ref ref) {
    return formatTime(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String Function(DateTime) value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String Function(DateTime)>(value),
    );
  }
}

String _$formatTimeHash() => r'6d77d2bee22ef50dfab4a8601958c5c0a1eab384';
