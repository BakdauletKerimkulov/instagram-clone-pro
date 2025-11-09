// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_content_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(VideoContentContoller)
const videoContentContollerProvider = VideoContentContollerFamily._();

final class VideoContentContollerProvider
    extends
        $AsyncNotifierProvider<VideoContentContoller, VideoPlayerController> {
  const VideoContentContollerProvider._({
    required VideoContentContollerFamily super.from,
    required String super.argument,
  }) : super(
         retry: null,
         name: r'videoContentContollerProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$videoContentContollerHash();

  @override
  String toString() {
    return r'videoContentContollerProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  VideoContentContoller create() => VideoContentContoller();

  @override
  bool operator ==(Object other) {
    return other is VideoContentContollerProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$videoContentContollerHash() =>
    r'2bf742defa0fd35a96d7c0fbe36599149eccb4cb';

final class VideoContentContollerFamily extends $Family
    with
        $ClassFamilyOverride<
          VideoContentContoller,
          AsyncValue<VideoPlayerController>,
          VideoPlayerController,
          FutureOr<VideoPlayerController>,
          String
        > {
  const VideoContentContollerFamily._()
    : super(
        retry: null,
        name: r'videoContentContollerProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  VideoContentContollerProvider call(String url) =>
      VideoContentContollerProvider._(argument: url, from: this);

  @override
  String toString() => r'videoContentContollerProvider';
}

abstract class _$VideoContentContoller
    extends $AsyncNotifier<VideoPlayerController> {
  late final _$args = ref.$arg as String;
  String get url => _$args;

  FutureOr<VideoPlayerController> build(String url);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<AsyncValue<VideoPlayerController>, VideoPlayerController>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<VideoPlayerController>,
                VideoPlayerController
              >,
              AsyncValue<VideoPlayerController>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
