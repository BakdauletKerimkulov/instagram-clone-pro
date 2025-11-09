// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:instagram_clone_pro/src/features/posts/domain/media_post.dart';

class Reels extends MediaPost {
  Reels({
    required this.duration,
    required this.audioTrackId,
    required super.id,
    required super.authorId,
    required super.postType,
    required super.timeStamp,
    required super.mediaUrl,
    required super.caption,
    required super.aspectRatio,
    required super.likeCount,
    required super.commentCount,
    required super.isAd,
    required super.isHidden,
    required super.isLikeCountHidden,
    required super.isPrivate,
  });

  //* specific data
  final int duration;
  final String audioTrackId;
}
