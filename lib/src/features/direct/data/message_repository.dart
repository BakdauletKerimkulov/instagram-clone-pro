import 'package:instagram_clone_pro/src/features/direct/domain/message.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'message_repository.g.dart';

abstract class MessageRepository {
  Stream<List<Message>> watchMessages(String chatId);

  Future<void> addMessage(String chatId, Message message);

  Future<void> removeMessageById(String chatId, String messageId);
}

@Riverpod(keepAlive: true)
MessageRepository messageRepository(Ref ref) => throw UnimplementedError();

@riverpod
Stream<List<Message>> listMessageStream(Ref ref, String chatId) {
  return ref.watch(messageRepositoryProvider).watchMessages(chatId);
}
