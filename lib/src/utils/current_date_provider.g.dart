// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_date_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(currentDateBuilder)
const currentDateBuilderProvider = CurrentDateBuilderProvider._();

final class CurrentDateBuilderProvider
    extends
        $FunctionalProvider<
          DateTime Function(),
          DateTime Function(),
          DateTime Function()
        >
    with $Provider<DateTime Function()> {
  const CurrentDateBuilderProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'currentDateBuilderProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$currentDateBuilderHash();

  @$internal
  @override
  $ProviderElement<DateTime Function()> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  DateTime Function() create(Ref ref) {
    return currentDateBuilder(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(DateTime Function() value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<DateTime Function()>(value),
    );
  }
}

String _$currentDateBuilderHash() =>
    r'693d3ea8bc060403f97448bd270df9195161317e';
