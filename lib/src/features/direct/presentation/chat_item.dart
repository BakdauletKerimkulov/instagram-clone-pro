// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/data/fake_direct_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/domain/chat.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:instagram_clone_pro/src/routing/app_router.dart';
import 'package:instagram_clone_pro/src/utils/app_show_menu.dart';

class ChatItem extends ConsumerWidget {
  const ChatItem({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.read(authRepositoryProvider).currentUser;
    final companionId = chat.userIds.firstWhere((id) => currentUser!.uid != id);
    final companion = ref.watch(fetchUserProvider(companionId)).value;

    return ListTile(
      onTap: () {
        context.goNamed(
          AppRoute.chat.name,
          pathParameters: {'id': chat.chatId},
        );
        debugPrint(chat.chatId);
      },
      onLongPress: () {
        final items = [
          PopupMenuItem(
            value: 'delete'.hardcoded,
            child: Text(
              'Delete'.hardcoded,
              style: TextStyle(color: Colors.red),
            ),
          ),
        ];

        appShowMenu(
          context: context,
          items: items,
          onSelected: (action) {
            if (action == 'delete') {
              ref.read(fakeDirectRepositoryProvider).removeChat(chat.chatId);
            }
          },
        );
      },
      leading: CircleAvatar(
        backgroundImage: companion != null
            ? AssetImage(companion.avatarUrl)
            : AssetImage('assets/images/noperson.jpg'),
      ),
      title: Text(companion?.userName ?? 'user'),
      subtitle: Text(switch (chat.lastMessageContent) {
        ChatContentType.text => 'message'.hardcoded,
        ChatContentType.photo => 'photo'.hardcoded,
        ChatContentType.video => 'video'.hardcoded,
        ChatContentType.voice => 'voice'.hardcoded,
        ChatContentType.postShare => 'postShare'.hardcoded,
        ChatContentType.reelShare => 'reelShare'.hardcoded,
      }),
      trailing: IconButton(
        onPressed: () {},
        icon: Icon(Icons.camera_alt_outlined),
      ),
    );
  }
}
