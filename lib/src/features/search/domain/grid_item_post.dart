// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';

class GridItemPost {
  final String postId;
  final String mediaUrl;
  final PostType postType;
  GridItemPost({
    required this.postId,
    required this.mediaUrl,
    required this.postType,
  });

  @override
  String toString() =>
      'PrePost(postId: $postId, url: $mediaUrl, postType: $postType)';

  @override
  bool operator ==(covariant GridItemPost other) {
    if (identical(this, other)) return true;

    return other.postId == postId &&
        other.mediaUrl == mediaUrl &&
        other.postType == postType;
  }

  @override
  int get hashCode => postId.hashCode ^ mediaUrl.hashCode ^ postType.hashCode;

  GridItemPost copyWith({String? postId, String? url, PostType? postType}) {
    return GridItemPost(
      postId: postId ?? this.postId,
      mediaUrl: url ?? mediaUrl,
      postType: postType ?? this.postType,
    );
  }
}
