import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/app_circular_progress_indicator.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/features/reels/application/reels_cache_service.dart';
import 'package:instagram_clone_pro/src/features/reels/data/fake_reels_repository.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class ReelsListNew extends ConsumerStatefulWidget {
  const ReelsListNew({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ReelsListNewState();
}

class _ReelsListNewState extends ConsumerState<ReelsListNew> {
  late PageController _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final reelsAsync = ref.watch(streamReelsProvider);
    return AsyncValueWidget(
      value: reelsAsync,
      data: (reels) {
        // Предзагрузка первого видео после первого build
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (reels.isNotEmpty) {
            ref.read(reelsCacheServiceProvider.notifier).preload(0, reels);
          }
        });

        return PageView.builder(
          scrollDirection: Axis.vertical,
          controller: _controller,
          onPageChanged: (index) {
            ref.read(reelsCacheServiceProvider.notifier).preload(index, reels);
          },
          itemBuilder: (context, index) {
            final reelsItem = reels[index];
            return ReelsItem(reelsItem);
          },
        );
      },
    );
  }
}

class ReelsItem extends ConsumerWidget {
  const ReelsItem(this.reelsItem, {super.key});

  final MediaPost reelsItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.watch(getControllerProvider(reelsItem.id));

    return controller != null && controller.value.isInitialized
        ? VisibilityDetector(
            key: ValueKey(reelsItem.id),
            onVisibilityChanged: (VisibilityInfo info) {},
            child: Stack(
              fit: StackFit.expand,
              children: [
                GestureDetector(
                  onTap: () {
                    controller.value.isPlaying
                        ? controller.pause()
                        : controller.play();
                  },
                  child: VideoPlayer(controller),
                ),
              ],
            ),
          )
        : const AppCircularProgressIndicator();
  }
}
