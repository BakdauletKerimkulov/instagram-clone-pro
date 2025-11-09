import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'reels_content_controller.g.dart';

@riverpod
class CurrentReelIndex extends _$CurrentReelIndex {
  @override
  int build() => 0;

  void setNewIndex(int newIndex) => state = newIndex;
}
