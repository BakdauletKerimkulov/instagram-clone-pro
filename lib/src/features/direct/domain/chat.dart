import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

enum ChatContentType { text, photo, video, voice, reelShare, postShare }

class Chat {
  final String chatId;
  final List<String> userIds;
  final String? lastMessageText;
  final String? lastMessageSenderId;
  final ChatContentType lastMessageContent;
  final DateTime lastMessageTime;
  final int unreadCount;
  final bool isGroup;
  final String? groupName;
  final String? groupImageUrl;
  final bool isMuted;
  final bool isPinned;
  final DateTime createdAt;
  final DateTime updatedAt;

  Chat({
    required this.chatId,
    required this.userIds,
    this.lastMessageText,
    this.lastMessageSenderId,
    required this.lastMessageContent,
    required this.lastMessageTime,
    required this.unreadCount,
    this.isGroup = false,
    this.groupName,
    this.groupImageUrl,
    this.isMuted = false,
    this.isPinned = false,
    required this.createdAt,
    required this.updatedAt,
  });

  Chat copyWith({
    String? chatId,
    List<String>? userIds,
    String? lastMessageText,
    String? lastMessageSenderId,
    ChatContentType? lastMessageContent,
    DateTime? lastMessageTime,
    int? unreadCount,
    bool? isGroup,
    String? groupName,
    String? groupImageUrl,
    bool? isMuted,
    bool? isPinned,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return Chat(
      chatId: chatId ?? this.chatId,
      userIds: userIds ?? this.userIds,
      lastMessageText: lastMessageText ?? this.lastMessageText,
      lastMessageSenderId: lastMessageSenderId ?? this.lastMessageSenderId,
      lastMessageContent: lastMessageContent ?? this.lastMessageContent,
      lastMessageTime: lastMessageTime ?? this.lastMessageTime,
      unreadCount: unreadCount ?? this.unreadCount,
      isGroup: isGroup ?? this.isGroup,
      groupName: groupName ?? this.groupName,
      groupImageUrl: groupImageUrl ?? this.groupImageUrl,
      isMuted: isMuted ?? this.isMuted,
      isPinned: isPinned ?? this.isPinned,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'chatId': chatId,
      'userIds': userIds,
      'lastMessageText': lastMessageText,
      'lastMessageSenderId': lastMessageSenderId,
      'lastMessageContent': lastMessageContent.name,
      'lastMessageTime': lastMessageTime.millisecondsSinceEpoch,
      'unreadCount': unreadCount,
      'isGroup': isGroup,
      'groupName': groupName,
      'groupImageUrl': groupImageUrl,
      'isMuted': isMuted,
      'isPinned': isPinned,
      'createdAt': createdAt.millisecondsSinceEpoch,
      'updatedAt': updatedAt.millisecondsSinceEpoch,
    };
  }

  factory Chat.fromMap(Map<String, dynamic> map) {
    return Chat(
      chatId: map['chatId'] as String,
      userIds: List<String>.from(map['userIds']),
      lastMessageText: map['lastMessageText'],
      lastMessageSenderId: map['lastMessageSenderId'],
      lastMessageContent: ChatContentType.values.byName(
        map['lastMessageContent'],
      ),
      lastMessageTime: DateTime.fromMillisecondsSinceEpoch(
        map['lastMessageTime'],
      ),
      unreadCount: map['unreadCount'] as int,
      isGroup: map['isGroup'] as bool? ?? false,
      groupName: map['groupName'],
      groupImageUrl: map['groupImageUrl'],
      isMuted: map['isMuted'] as bool? ?? false,
      isPinned: map['isPinned'] as bool? ?? false,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt']),
      updatedAt: DateTime.fromMillisecondsSinceEpoch(map['updatedAt']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Chat.fromJson(String source) => Chat.fromMap(json.decode(source));

  @override
  String toString() =>
      'Chat(chatId: $chatId, userIds: $userIds, lastMessageText: $lastMessageText, lastMessageContent: $lastMessageContent, unreadCount: $unreadCount)';

  @override
  bool operator ==(covariant Chat other) {
    return identical(this, other) ||
        (other.chatId == chatId &&
            listEquals(other.userIds, userIds) &&
            other.lastMessageContent == lastMessageContent &&
            other.unreadCount == unreadCount);
  }

  @override
  int get hashCode =>
      chatId.hashCode ^
      userIds.hashCode ^
      lastMessageContent.hashCode ^
      unreadCount.hashCode;
}
