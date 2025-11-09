// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoGreedItem extends StatefulWidget {
  const VideoGreedItem({super.key, required this.mediaUrl});

  final String mediaUrl;

  @override
  State<VideoGreedItem> createState() => _VideoGreedItemState();
}

class _VideoGreedItemState extends State<VideoGreedItem> {
  VideoPlayerController? _controller;
  bool _isInitialized = false;

  void _initializeVideo() async {
    if (_controller != null) {
      if (_controller!.value.isPlaying) {
        _controller!.pause();
      } else {
        _controller!.play();
      }
      return;
    }

    _controller = VideoPlayerController.networkUrl(Uri.parse(widget.mediaUrl));
    try {
      await _controller!.initialize();
      _controller!.setLooping(true);
      setState(() {
        _isInitialized = true;
      });
      _controller!.play();
    } catch (e) {
      setState(() {
        _isInitialized = false;
        _controller = null;
      });
    }
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _initializeVideo,
      child: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Center(
          child:
              _isInitialized &&
                  _controller != null &&
                  _controller!.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller!.value.aspectRatio,
                  child: VideoPlayer(_controller!),
                )
              : Stack(
                  alignment: Alignment.center,
                  children: [
                    // Статичное превью/заглушка
                    Container(color: Colors.grey[800]),
                    // Иконка для запуска
                    const Icon(
                      Icons.play_circle_fill,
                      color: Colors.white70,
                      size: 48,
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
