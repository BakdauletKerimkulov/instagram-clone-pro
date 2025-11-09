import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
enum PostType { photo, video, carousel, reel }

typedef PostID = String;

class MediaPost {
  //* identification
  final PostID id;
  final String authorId;
  final PostType postType;
  final DateTime timeStamp;

  //* content
  final List<String> mediaUrl;
  final String caption;
  final double aspectRatio;
  final String? location;
  final int likeCount;
  final int commentCount;

  //* privacy
  final bool isAd;
  final bool isHidden;
  final bool isLikeCountHidden;
  final bool isPrivate;

  MediaPost({
    required this.id,
    required this.authorId,
    required this.postType,
    required this.timeStamp,
    required this.mediaUrl,
    required this.caption,
    required this.aspectRatio,
    this.location,
    required this.likeCount,
    required this.commentCount,
    required this.isAd,
    required this.isHidden,
    required this.isLikeCountHidden,
    required this.isPrivate,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'authorId': authorId,
      'postType': postType.name,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'mediaUrl': mediaUrl,
      'caption': caption,
      'aspectRatio': aspectRatio,
      if (location != null) 'location': location,
      'likeCount': likeCount,
      'commentCount': commentCount,
      'isAd': isAd,
      'isHidden': isHidden,
      'isLikeCountHidden': isLikeCountHidden,
      'isPrivate': isPrivate,
    };
  }

  factory MediaPost.fromMap(Map<String, dynamic> map) {
    return MediaPost(
      id: map['id'] as String,
      authorId: map['authorId'] as String,
      postType: PostType.values.byName(map['postType'] as String),
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
      mediaUrl: List<String>.from((map['mediaUrl'] as List<String>)),
      caption: map['caption'] as String,
      aspectRatio: map['aspectRatio'] as double,
      location: map['location'] as String?,
      likeCount: map['likeCount'] as int,
      commentCount: map['commentCount'] as int,
      isAd: map['isAs'] as bool,
      isHidden: map['isHidden'] as bool,
      isLikeCountHidden: map['isLikeCountHidden'] as bool,
      isPrivate: map['isPrivate'],
    );
  }

  String toJson() => json.encode(toMap());

  factory MediaPost.fromJson(String source) =>
      MediaPost.fromMap(json.decode(source) as Map<String, dynamic>);

  MediaPost copyWith({
    PostID? id,
    String? authorId,
    PostType? postType,
    DateTime? timeStamp,
    List<String>? mediaUrl,
    String? caption,
    double? aspectRatio,
    String? location,
    int? likeCount,
    int? commentCount,
    bool? isAd,
    bool? isHidden,
    bool? isLikeCountHidden,
    bool? isPrivate,
  }) {
    return MediaPost(
      id: id ?? this.id,
      authorId: authorId ?? this.authorId,
      postType: postType ?? this.postType,
      timeStamp: timeStamp ?? this.timeStamp,
      mediaUrl: mediaUrl ?? this.mediaUrl,
      caption: caption ?? this.caption,
      aspectRatio: aspectRatio ?? this.aspectRatio,
      location: location ?? this.location,
      likeCount: likeCount ?? this.likeCount,
      commentCount: commentCount ?? this.commentCount,
      isAd: isAd ?? this.isAd,
      isHidden: isHidden ?? this.isHidden,
      isLikeCountHidden: isLikeCountHidden ?? this.isLikeCountHidden,
      isPrivate: isPrivate ?? this.isPrivate,
    );
  }

  @override
  bool operator ==(covariant MediaPost other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.authorId == authorId &&
        other.postType == postType &&
        other.timeStamp == timeStamp &&
        listEquals(other.mediaUrl, mediaUrl) &&
        other.caption == caption &&
        other.aspectRatio == aspectRatio &&
        other.location == location &&
        other.likeCount == likeCount &&
        other.commentCount == commentCount &&
        other.isAd == isAd &&
        other.isHidden == isHidden &&
        other.isLikeCountHidden == isLikeCountHidden &&
        other.isPrivate == isPrivate;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        authorId.hashCode ^
        postType.hashCode ^
        timeStamp.hashCode ^
        mediaUrl.hashCode ^
        caption.hashCode ^
        aspectRatio.hashCode ^
        location.hashCode ^
        likeCount.hashCode ^
        commentCount.hashCode ^
        isAd.hashCode ^
        isHidden.hashCode ^
        isLikeCountHidden.hashCode ^
        isPrivate.hashCode;
  }

  @override
  String toString() {
    return 'MediaPost(id: $id, authorId: $authorId, postType: $postType, timeStamp: $timeStamp, mediaUrl: $mediaUrl, caption: $caption, aspectRatio: $aspectRatio, location: $location, likeCount: $likeCount, commentCount: $commentCount, isAd: $isAd, isHidden: $isHidden, isLikeCountHidden: $isLikeCountHidden, isPrivate: $isPrivate)';
  }
}



// PostType.values.byName(map['postType'] as String)