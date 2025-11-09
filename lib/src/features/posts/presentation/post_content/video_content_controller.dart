import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'video_content_controller.g.dart';

@riverpod
class VideoContentContoller extends _$VideoContentContoller {
  VideoPlayerController? controller;

  static const int _maxRepeats = 2;

  int repeat = 0;

  void _onVideoUpdate() {
    final controller = state.value;
    if (controller == null || !controller.value.isInitialized) return;

    final position = controller.value.position;
    final duration = controller.value.duration;

    if (position >= duration) {
      if (repeat < _maxRepeats) {
        repeat++;
        controller.seekTo(Duration.zero);
        controller.play();
      } else {
        controller.seekTo(Duration.zero);
        controller.pause();
        controller.removeListener(_onVideoUpdate);
      }
    }
  }

  @override
  FutureOr<VideoPlayerController> build(String url) async {
    try {
      controller = VideoPlayerController.networkUrl(Uri.parse(url));

      await controller!.initialize();

      controller!.addListener(_onVideoUpdate);

      ref.onDispose(() {
        controller!.dispose();
      });

      return controller!;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}
