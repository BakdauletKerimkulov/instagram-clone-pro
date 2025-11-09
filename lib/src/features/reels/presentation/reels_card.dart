// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_pro/src/common_widgets/app_circular_progress_indicator.dart';
import 'package:instagram_clone_pro/src/common_widgets/error_message_widget.dart';
import 'package:instagram_clone_pro/src/common_widgets/mute_button.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/comments/presentation/comment_button.dart';
import 'package:instagram_clone_pro/src/features/likes/presentation/like_button.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/features/reels/presentation/reels_author_info.dart';
import 'package:instagram_clone_pro/src/features/reels/presentation/reels_content_controller.dart';
import 'package:instagram_clone_pro/src/utils/mute_controller.dart';
import 'package:video_player/video_player.dart';

const audioImageSize = Sizes.p32;

class ReelsCard extends ConsumerStatefulWidget {
  const ReelsCard({super.key, required this.reelItem, required this.reelIndex});

  final MediaPost reelItem;
  final int reelIndex;

  @override
  ConsumerState<ReelsCard> createState() => _ReelsCardState();
}

class _ReelsCardState extends ConsumerState<ReelsCard> {
  late VideoPlayerController _controller;
  bool _isInitialized = false;
  bool _isPlaying = false;
  ProviderSubscription? _sub;

  @override
  void initState() {
    super.initState();
    _sub = ref.listenManual(currentReelIndexProvider, (prev, next) {
      if (!_isInitialized) return;
      if (next == widget.reelIndex) {
        _controller.play();
        setState(() => _isPlaying = true);
      } else {
        _controller.pause();
        setState(() => _isPlaying = false);
      }
    });

    _initializeController();

    _controller.addListener(() {
      if (mounted) {
        final playing = _controller.value.isPlaying;
        if (playing != _isPlaying) {
          setState(() => _isPlaying = playing);
        }
      }
    });
  }

  void _initializeController() {
    _controller =
        VideoPlayerController.networkUrl(
            Uri.parse(widget.reelItem.mediaUrl.first),
          )
          ..setLooping(true)
          ..initialize()
              .then((_) {
                if (mounted) {
                  setState(() => _isInitialized = true);

                  if (widget.reelIndex == ref.read(currentReelIndexProvider)) {
                    _controller.play();
                    setState(() => _isPlaying = true);
                  }
                }
              })
              .catchError((er) {
                if (mounted) {
                  setState(() {
                    _isInitialized = false;
                  });
                }
                debugPrint(er.toString());
              });
  }

  void _togglePlayPause() {
    if (_controller.value.isInitialized) {
      if (_controller.value.isPlaying) {
        _controller.pause();
      } else {
        _controller.play();
      }
      setState(() => _isPlaying = _controller.value.isPlaying);
    }
  }

  @override
  void dispose() {
    _sub?.close();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_controller.value.hasError) {
      return ErrorMessageWidget('video download error');
    }

    if (!_isInitialized) {
      return AppCircularProgressIndicator();
    }

    final muteState = ref.watch(muteControllerProvider);

    return Stack(
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: _togglePlayPause,
          child: SizedBox.expand(
            child: FittedBox(
              fit: BoxFit.cover,
              child: SizedBox(
                height: _controller.value.size.height,
                width: _controller.value.size.width,
                child: VideoPlayer(_controller),
              ),
            ),
          ),
        ),

        if (!_isPlaying)
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                MuteButton(
                  isMuted: muteState,
                  onTap: ref.read(muteControllerProvider.notifier).toggleMute,
                  radius: 20,
                  iconSize: 24,
                ),

                gapH16,

                GestureDetector(
                  onTap: _togglePlayPause,
                  child: CircleAvatar(
                    backgroundColor: AppColors.reelsButtonBackColor,
                    radius: 35,
                    child: Icon(
                      Icons.play_arrow,
                      size: Sizes.p48,
                      color: AppColors.reelsPrimaryButton,
                    ),
                  ),
                ),
              ],
            ),
          ),

        // Action buttons справа
        Positioned(
          right: 0,
          bottom: Sizes.p24,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              LikeButton(parentId: widget.reelItem.id, isReels: true),
              CommentButton(postId: widget.reelItem.id, isReels: true),
              IconButton(
                onPressed: () {},
                icon: SvgPicture.asset(
                  'assets/icons/instagram_share_icon.svg',
                  height: Sizes.p24,
                  width: Sizes.p24,
                  colorFilter: ColorFilter.mode(
                    AppColors.reelsPrimaryButton,
                    BlendMode.srcIn,
                  ),
                ),
              ),
              IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.more_vert,
                  color: AppColors.reelsPrimaryButton,
                ),
              ),
              Container(
                height: audioImageSize,
                width: audioImageSize,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColors.reelsOutlineColor,
                    width: 2.0,
                  ),
                  borderRadius: BorderRadius.circular(6.0),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(6.0),
                  child: Image.network(
                    errorBuilder: (context, error, st) =>
                        const Center(child: Icon(Icons.error)),
                    'https://www.shazam.com/mkimage/image/thumb/Music211/v4/9f/bc/88/9fbc88f4-dc27-7f24-79d9-d72e746ba94c/0.jpg/1275x1275bb-60.webp',
                  ),
                ),
              ),
            ],
          ),
        ),

        // Author info
        Positioned(
          left: 0,
          bottom: 0,
          child: ReelsAuthorInfo(authorId: widget.reelItem.authorId),
        ),
      ],
    );
  }
}
