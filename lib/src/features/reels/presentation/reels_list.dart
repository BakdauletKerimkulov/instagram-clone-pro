// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/features/reels/data/fake_reels_repository.dart';
import 'package:instagram_clone_pro/src/features/reels/presentation/reels_card.dart';
import 'package:instagram_clone_pro/src/features/reels/presentation/reels_content_controller.dart';

class ReelsList extends ConsumerStatefulWidget {
  const ReelsList({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReelsListState();
}

class _ReelsListState extends ConsumerState<ReelsList> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
    _pageController.addListener(_onPageChanged);
  }

  @override
  void dispose() {
    _pageController.removeListener(_onPageChanged);
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged() {
    final p = _pageController.page;
    if (p == null) return;
    final rounded = p.round();
    if ((p - rounded).abs() < 0.01) {
      ref.read(currentReelIndexProvider.notifier).setNewIndex(rounded);
    }
  }

  @override
  Widget build(BuildContext context) {
    final asyncReels = ref.watch(streamReelsProvider);
    return AsyncValueWidget(
      value: asyncReels,
      data: (reels) => PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        itemCount: reels.length,
        itemBuilder: (context, index) {
          final reelItem = reels[index];
          return ReelsCard(reelItem: reelItem, reelIndex: index);
        },
      ),
    );
  }
}
