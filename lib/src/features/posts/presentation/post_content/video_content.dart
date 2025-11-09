// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/app_circular_progress_indicator.dart';
import 'package:instagram_clone_pro/src/common_widgets/mute_button.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post_content/video_content_controller.dart';
import 'package:instagram_clone_pro/src/utils/mute_controller.dart';
import 'package:video_player/video_player.dart';
import 'package:visibility_detector/visibility_detector.dart';

class VideoContent extends ConsumerStatefulWidget {
  const VideoContent({super.key, required this.mediaUrl});

  final String mediaUrl;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoContentNewState();
}

class _VideoContentNewState extends ConsumerState<VideoContent> {
  bool _isVisible = false;

  void _handleVisibilityChanged(VisibilityInfo info) {
    if (!mounted) return;

    final visible = info.visibleFraction > 0.5;

    if (visible != _isVisible) {
      _isVisible = visible;

      final controllerState = ref.read(
        videoContentContollerProvider(widget.mediaUrl),
      );

      if (controllerState.hasValue) {
        final controller = controllerState.value!;
        if (visible) {
          controller.play();
        } else {
          controller.pause();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final controllerAsync = ref.watch(
      videoContentContollerProvider(widget.mediaUrl),
    );

    final isMuted = ref.watch(muteControllerProvider);

    if (controllerAsync.hasValue) {
      controllerAsync.value!.setVolume(isMuted ? 0 : 1);
    }

    return VisibilityDetector(
      key: ValueKey(widget.mediaUrl),
      onVisibilityChanged: _handleVisibilityChanged,
      child: Stack(
        children: [
          controllerAsync.when(
            data: (controller) {
              return VideoPlayer(controller);
            },
            error: (e, st) =>
                Text('Something went wrong. Info: ${e.toString()}'),
            loading: () => AppCircularProgressIndicator(),
          ),

          // Кнопки паузы и звука
          Positioned(
            right: 8,
            bottom: 8,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: MuteButton(
                isMuted: isMuted,
                onTap: () {
                  ref.read(muteControllerProvider.notifier).toggleMute();
                },
                radius: 12,
                iconSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
