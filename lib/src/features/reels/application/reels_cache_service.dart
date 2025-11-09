import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/utils/time_at.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:video_player/video_player.dart';

part 'reels_cache_service.g.dart';

@riverpod
class ReelsCacheService extends _$ReelsCacheService {
  final Map<String, VideoPlayerController> _controllers = {};

  @override
  void build() {
    // nothing to do
    ref.onDispose(() {
      for (final c in _controllers.values) {
        c.dispose();
      }
      _controllers.clear();
    });
  }

  //Передает контроллер из мапы
  VideoPlayerController? getController(String id) => _controllers[id];

  // Только создаёт и добавляет в кэш
  void _addController(String id, String url) {
    if (_controllers.containsKey(id)) return;
    final controller = VideoPlayerController.networkUrl(Uri.parse(url));
    controller.initialize().then((_) {
      controller
        ..setLooping(true)
        ..setVolume(1);

      _controllers[id] = controller;

      ref.invalidate(getControllerProvider(id));

      debugPrint(
        'Controller INITIALIZED and CACHED at ${ref.read(timeAtProvider(DateTime.now()))}: $id',
      );
    });
  }

  void removeControllerByKey(String id) {
    _controllers.remove(id);
  }

  // Получает текущий индекс и создает контроллеры для соседних виджетов в рилсе
  void preload(int currentIndex, List<MediaPost> reels) {
    final keptIds = <String>{};
    debugPrint('PRELOAD called for index: $currentIndex');

    for (int i = currentIndex - 1; i <= currentIndex + 1; i++) {
      if (i >= 0 && i < reels.length) {
        final post = reels[i];
        keptIds.add(post.id);
        _addController(post.id, post.mediaUrl.first);
      }
    }

    final toRemove = _controllers.keys
        .where((id) => !keptIds.contains(id))
        .toList();
    for (final id in toRemove) {
      _controllers[id]!.dispose();
      _controllers.remove(id);
    }
  }
}

@riverpod
VideoPlayerController? getController(Ref ref, String id) {
  final service = ref.watch(reelsCacheServiceProvider.notifier);
  final controller = service.getController(id);

  return controller;
}
