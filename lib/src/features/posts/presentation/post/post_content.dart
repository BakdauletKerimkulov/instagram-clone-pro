// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/likes/application/like_service_provider.dart';
import 'package:instagram_clone_pro/src/features/likes/domain/like.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post_content/carousel_content.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post_content/photo_content.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post_content/video_content.dart';

class PostContent extends ConsumerWidget {
  const PostContent({
    super.key,
    required this.postId,
    required this.type,
    required this.mediaUrl,
    required this.aspectRatio,
  });

  final String postId;
  final PostType type;
  final List<String> mediaUrl;
  final double aspectRatio;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authStateChangesProvider).value;

    return GestureDetector(
      onDoubleTap: () {
        if (user != null) {
          final like = Like(
            parentId: postId,
            userId: user.uid,
            createdAt: DateTime.now(),
          );
          ref
              .read(toggleLikeControllerProvider.notifier)
              .toggleLike(postId, like);
        }
      },
      child: Container(
        color: Colors.grey,
        child: AspectRatio(
          aspectRatio: aspectRatio,
          child: switch (type) {
            PostType.photo => PhotoContent(mediaUrl: mediaUrl.first),
            PostType.video ||
            PostType.reel => VideoContent(mediaUrl: mediaUrl.first),
            PostType.carousel => CarouselContent(mediaUrls: mediaUrl),
          },
        ),
      ),
    );
  }
}
