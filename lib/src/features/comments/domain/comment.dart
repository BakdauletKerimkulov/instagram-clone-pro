// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:uuid/uuid.dart';

typedef CommentID = String;

class Comment {
  Comment({
    CommentID? id,
    required this.userId,
    required this.text,
    this.isLiked = false,
    required this.likeCount,
    required this.createdAt,
  }) : id = id ?? const Uuid().v4();

  final CommentID id;
  final String userId;
  final String text;
  final bool isLiked;
  final int likeCount;
  final DateTime createdAt;

  Comment copyWith({
    CommentID? id,
    String? userId,
    String? text,
    bool? isLiked,
    int? likeCount,
    DateTime? createdAt,
  }) {
    return Comment(
      id: id ?? this.id,
      userId: userId ?? this.userId,
      text: text ?? this.text,
      isLiked: isLiked ?? this.isLiked,
      likeCount: likeCount ?? this.likeCount,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'userId': userId,
      'text': text,
      'isLiked': isLiked,
      'likeCount': likeCount,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    return Comment(
      id: map['id'] as String,
      userId: map['userId'] as String,
      text: map['text'] as String,
      isLiked: map['isLiked'] as bool,
      likeCount: map['likeCount'] as int,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Comment(id: $id, userId: $userId, text: $text, isLiked: $isLiked, likeCount: $likeCount, createdAt: $createdAt)';
  }

  @override
  bool operator ==(covariant Comment other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.userId == userId &&
        other.text == text &&
        other.isLiked == isLiked &&
        other.likeCount == likeCount &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userId.hashCode ^
        text.hashCode ^
        isLiked.hashCode ^
        likeCount.hashCode ^
        createdAt.hashCode;
  }
}
