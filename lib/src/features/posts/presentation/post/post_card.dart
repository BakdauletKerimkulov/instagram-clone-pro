import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post/post_content.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post/post_description.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post/post_footer.dart';
import 'package:instagram_clone_pro/src/features/posts/presentation/post/post_header.dart';

class PostCard extends ConsumerWidget {
  const PostCard({super.key, required this.post});

  final MediaPost post;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(fetchUserProvider(post.authorId)).value;
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          PostHeader(
            avatarUrl: user?.avatarUrl,
            userName: user?.userName ?? 'guest123',
            createdAt: post.timeStamp,
          ),
          PostContent(
            postId: post.id,
            type: post.postType,
            mediaUrl: post.mediaUrl,
            aspectRatio: post.aspectRatio,
          ),
          PostFooter(post.id),
          DescriptionText(
            username: user?.userName ?? 'guest123',
            text: post.caption,
            createdAt: post.timeStamp,
          ),
        ],
      ),
    );
  }
}
