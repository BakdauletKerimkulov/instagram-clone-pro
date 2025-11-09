// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:convert';

import 'package:instagram_clone_pro/src/features/direct/domain/chat.dart';

enum Status { sent, delivered, read }

class Message {
  Message({
    required this.messageId,
    required this.senderId,
    required this.messageType,
    required this.contentData,
    required this.timeStamp,
    required this.status,
    this.replyToMessageId,
  });
  final String messageId;
  final String senderId;
  final ChatContentType messageType;
  final String contentData;
  final DateTime timeStamp;
  final Status status;
  final String? replyToMessageId;

  Message copyWith({
    String? messageId,
    String? senderId,
    ChatContentType? messageType,
    String? contentData,
    DateTime? timeStamp,
    Status? status,
    String? replyToMessageId,
  }) {
    return Message(
      messageId: messageId ?? this.messageId,
      senderId: senderId ?? this.senderId,
      messageType: messageType ?? this.messageType,
      contentData: contentData ?? this.contentData,
      timeStamp: timeStamp ?? this.timeStamp,
      status: status ?? this.status,
      replyToMessageId: replyToMessageId ?? this.replyToMessageId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'messageId': messageId,
      'senderId': senderId,
      'messageType': messageType.name,
      'contentData': contentData,
      'timeStamp': timeStamp.millisecondsSinceEpoch,
      'status': status.name,
      'replyToMessageId': replyToMessageId,
    };
  }

  factory Message.fromMap(Map<String, dynamic> map) {
    return Message(
      messageId: map['messageId'] as String,
      senderId: map['senderId'] as String,
      messageType: ChatContentType.values.byName(map['messageType']),
      contentData: map['contentData'] as String,
      timeStamp: DateTime.fromMillisecondsSinceEpoch(map['timeStamp'] as int),
      status: Status.values.byName(map['status']),
      replyToMessageId: map['replyToMessageId'] != null
          ? map['replyToMessageId'] as String
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Message.fromJson(String source) =>
      Message.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Message(messageId: $messageId, senderId: $senderId, messageType: $messageType, contentData: $contentData, timeStamp: $timeStamp, status: $status, replyToMessageId: $replyToMessageId)';
  }

  @override
  bool operator ==(covariant Message other) {
    if (identical(this, other)) return true;

    return other.messageId == messageId &&
        other.senderId == senderId &&
        other.messageType == messageType &&
        other.contentData == contentData &&
        other.timeStamp == timeStamp &&
        other.status == status &&
        other.replyToMessageId == replyToMessageId;
  }

  @override
  int get hashCode {
    return messageId.hashCode ^
        senderId.hashCode ^
        messageType.hashCode ^
        contentData.hashCode ^
        timeStamp.hashCode ^
        status.hashCode ^
        replyToMessageId.hashCode;
  }
}


// Нужно еще статус, что собеседник читает; онлайн статус собеседника; процесс загрузки медиафайлов, отправленных пользователем