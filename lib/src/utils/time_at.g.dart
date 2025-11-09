// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'time_at.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(timeAt)
const timeAtProvider = TimeAtFamily._();

final class TimeAtProvider extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const TimeAtProvider._({
    required TimeAtFamily super.from,
    required DateTime super.argument,
  }) : super(
         retry: null,
         name: r'timeAtProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$timeAtHash();

  @override
  String toString() {
    return r'timeAtProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    final argument = this.argument as DateTime;
    return timeAt(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is TimeAtProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$timeAtHash() => r'7825ef62fcde415ec0d4fc718cbdc421e5eaf878';

final class TimeAtFamily extends $Family
    with $FunctionalFamilyOverride<String, DateTime> {
  const TimeAtFamily._()
    : super(
        retry: null,
        name: r'timeAtProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  TimeAtProvider call(DateTime time) =>
      TimeAtProvider._(argument: time, from: this);

  @override
  String toString() => r'timeAtProvider';
}
