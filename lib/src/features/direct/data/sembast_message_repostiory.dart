import 'package:instagram_clone_pro/src/features/direct/data/message_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/domain/message.dart';
import 'package:instagram_clone_pro/src/utils/database_service.dart';
import 'package:sembast/utils/sembast_import_export.dart';

class SembastMessageRepostiory implements MessageRepository {
  SembastMessageRepostiory(this.dbService);
  final DatabaseService dbService;

  final _store = StoreRef('messages');

  @override
  Future<void> addMessage(String chatId, Message message) async {
    final record = _store.record(chatId);
    record.put(dbService.db, message.toJson());
  }

  @override
  Future<void> removeMessageById(String chatId, String messageId) {
    throw UnimplementedError();
  }

  @override
  Stream<List<Message>> watchMessages(String chatId) {
    final record = _store.record(chatId);

    return record.onSnapshot(dbService.db).map((snapshot) {
      if (snapshot == null || snapshot.value == null) return <Message>[];

      final data = snapshot.value as List<dynamic>;
      return data.map((json) => Message.fromJson(json)).toList();
    });
  }
}
