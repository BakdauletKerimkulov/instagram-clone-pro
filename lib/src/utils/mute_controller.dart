import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'mute_controller.g.dart';

@Riverpod(keepAlive: true)
class MuteController extends _$MuteController {
  @override
  bool build() => true;

  void toggleMute() => state = !state;
}
