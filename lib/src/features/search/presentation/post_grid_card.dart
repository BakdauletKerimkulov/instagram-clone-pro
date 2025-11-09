import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/features/search/domain/grid_item_post.dart';
import 'package:instagram_clone_pro/src/features/search/presentation/video_greed_screen.dart';

class PostGridCard extends ConsumerWidget {
  const PostGridCard(this.post, {super.key});

  final GridItemPost post;

  static const postCardKey = Key('post-card');

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SizedBox(
      height: 200.0,
      child: InkWell(
        key: postCardKey,
        child: Stack(
          children: [
            post.postType == PostType.photo
                ? Image.network(
                    post.mediaUrl,
                    width: double.infinity,
                    height: double.infinity,
                    fit: BoxFit.cover,
                    errorBuilder: (context, object, st) => Container(
                      color: Colors.grey,
                      child: Center(child: Icon(Icons.error, size: Sizes.p30)),
                    ),
                  )
                : VideoGreedItem(mediaUrl: post.mediaUrl),
            Positioned(
              top: 16,
              right: 16,
              child: switch (post.postType) {
                PostType.video => SvgPicture.asset(
                  'assets/icons/instagram_reels_icon_full.svg',
                ),
                PostType.carousel => SvgPicture.asset(
                  'assets/icons/carousel-icon.svg',
                ),
                PostType.photo => SizedBox(
                  child: Center(child: Text('It\'s photo')),
                ),
                PostType.reel => SizedBox(
                  child: Center(child: Text('It\'s reels')),
                ),
              },
            ),
          ],
        ),
      ),
    );
  }
}
