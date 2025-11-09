import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

base class AsyncErrorLogger extends ProviderObserver {
  @override
  void didUpdateProvider(
    ProviderObserverContext context,
    Object? previousValue,
    Object? newValue,
  ) {
    debugPrint(newValue.toString());
  }
}
