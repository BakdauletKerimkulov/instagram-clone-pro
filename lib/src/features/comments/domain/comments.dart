// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:instagram_clone_pro/src/features/comments/domain/comment.dart';

class Comments {
  const Comments([this.items = const {}]);

  final Map<CommentID, Comment> items;

  Comments copyWith({Map<CommentID, Comment>? items}) {
    return Comments(items ?? this.items);
  }

  Map<String, dynamic> toMap() {
    return {'items': items.map((key, value) => MapEntry(key, value.toMap()))};
  }

  factory Comments.fromMap(Map<String, dynamic> map) {
    return Comments(
      Map<CommentID, Comment>.from(
        (map['items'] as Map).map(
          (key, value) => MapEntry(
            key as CommentID,
            Comment.fromMap(value as Map<String, dynamic>),
          ),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comments.fromJson(String source) =>
      Comments.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Comments(items: $items)';

  @override
  bool operator ==(covariant Comments other) {
    if (identical(this, other)) return true;
    return mapEquals(other.items, items);
  }

  @override
  int get hashCode => items.hashCode;
}

extension CommentItems on Comments {
  List<Comment> toItemsList() {
    return items.entries.map((entry) {
      return Comment(
        id: entry.key,
        userId: entry.value.userId,
        text: entry.value.text,
        isLiked: entry.value.isLiked,
        likeCount: entry.value.likeCount,
        createdAt: entry.value.createdAt,
      );
    }).toList();
  }
}
