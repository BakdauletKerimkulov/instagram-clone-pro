import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/app_circular_progress_indicator.dart';
import 'package:instagram_clone_pro/src/common_widgets/error_message_widget.dart';

class AsyncValueWidget<T> extends StatelessWidget {
  const AsyncValueWidget({super.key, required this.value, required this.data});

  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      error: (e, st) => Center(child: ErrorMessageWidget(e.toString())),
      loading: () => const AppCircularProgressIndicator(),
    );
  }
}

/// Sliver equivalent of [AsyncValueWidget]
class AsyncValueSliverWidget<T> extends StatelessWidget {
  const AsyncValueSliverWidget({
    super.key,
    required this.value,
    required this.data,
  });
  final AsyncValue<T> value;
  final Widget Function(T) data;

  @override
  Widget build(BuildContext context) {
    return value.when(
      data: data,
      loading: () => const SliverToBoxAdapter(
        child: Center(child: CircularProgressIndicator()),
      ),
      error: (e, st) => SliverToBoxAdapter(
        child: Center(child: ErrorMessageWidget(e.toString())),
      ),
    );
  }
}
