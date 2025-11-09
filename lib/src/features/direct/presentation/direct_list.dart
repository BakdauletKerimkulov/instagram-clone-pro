import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/features/direct/data/fake_direct_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/presentation/chat_item.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class DirectList extends ConsumerWidget {
  const DirectList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatsAsync = ref.watch(watchChatsProvider);

    return AsyncValueSliverWidget(
      value: chatsAsync,
      data: (chats) {
        return chats.isEmpty
            ? SliverToBoxAdapter(
                child: Center(child: Text('No chat'.hardcoded)),
              )
            : SliverList(
                delegate: SliverChildBuilderDelegate(childCount: chats.length, (
                  context,
                  index,
                ) {
                  final chat = chats[index];
                  return ChatItem(chat: chat);
                }),
              );
      },
    );
  }
}
