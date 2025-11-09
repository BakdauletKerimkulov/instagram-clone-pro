import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class Like {
  Like({required this.parentId, required this.userId, required this.createdAt});
  final String parentId;
  final String userId;
  final DateTime createdAt;

  Like copyWith({String? parentId, String? userId, DateTime? createdAt}) {
    return Like(
      parentId: parentId ?? this.parentId,
      userId: userId ?? this.userId,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'parentId': parentId,
      'userId': userId,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory Like.fromMap(Map<String, dynamic> map) {
    return Like(
      parentId: map['parentId'] as String,
      userId: map['userId'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory Like.fromJson(String source) =>
      Like.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'Like(parentId: $parentId, userId: $userId, createdAt: $createdAt)';

  @override
  bool operator ==(covariant Like other) {
    if (identical(this, other)) return true;

    return other.parentId == parentId &&
        other.userId == userId &&
        other.createdAt == createdAt;
  }

  @override
  int get hashCode => parentId.hashCode ^ userId.hashCode ^ createdAt.hashCode;
}
