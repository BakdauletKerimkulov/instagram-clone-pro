// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:collection/collection.dart';
import 'package:instagram_clone_pro/src/constants/test_chats.dart';
import 'package:instagram_clone_pro/src/features/direct/domain/chat.dart';
import 'package:instagram_clone_pro/src/utils/in_memory_store.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'fake_direct_repository.g.dart';

class FakeDirectRepository {
  final _chats = InMemoryStore<List<Chat>>(kTestChats);

  Future<List<Chat>> fetchChats() {
    return Future.value(_chats.value);
  }

  Future<Chat?> fetchChatById(String chatId) async {
    return await Future.value(
      _chats.value.firstWhere((chat) => chat.chatId == chatId),
    );
  }

  Stream<List<Chat>> watchChats() => _chats.stream;

  Future<void> removeChat(String chatId) async {
    final updated = _chats.value.where((ch) => ch.chatId != chatId).toList();
    _chats.value = updated;
  }

  Future<void> addChat(Chat chat) async {
    final updated = [..._chats.value, chat];
    _chats.value = updated;
  }
}

@riverpod
FakeDirectRepository fakeDirectRepository(Ref ref) {
  return FakeDirectRepository();
}

@riverpod
Stream<List<Chat>> watchChats(Ref ref) {
  return ref.watch(fakeDirectRepositoryProvider).watchChats();
}

@riverpod
Future<Chat?> fetchChatById(Ref ref, String chatId) {
  return ref.watch(fakeDirectRepositoryProvider).fetchChatById(chatId);
}

@riverpod
Stream<Chat?> chat(Ref ref, String chatId) {
  return ref
      .watch(fakeDirectRepositoryProvider)
      .watchChats()
      .map((chats) => chats.firstWhereOrNull((chat) => chat.chatId == chatId));
}
