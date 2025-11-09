// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_clone_pro/src/common_widgets/async_value_widget.dart';
import 'package:instagram_clone_pro/src/common_widgets/empty_placeholder_widget.dart';
import 'package:instagram_clone_pro/src/constants/app_colors.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/features/auth/data/fake_auth_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/data/user_repository.dart';
import 'package:instagram_clone_pro/src/features/auth/domain/app_user.dart';
import 'package:instagram_clone_pro/src/features/direct/data/fake_direct_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/data/message_repository.dart';
import 'package:instagram_clone_pro/src/features/direct/domain/chat.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';
import 'package:instagram_clone_pro/src/routing/app_router.dart';
import 'package:instagram_clone_pro/src/utils/time_at.dart';

class ChatScreen extends ConsumerWidget {
  const ChatScreen({super.key, required this.chatId});

  final String chatId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatAsync = ref.watch(chatProvider(chatId));
    return AsyncValueWidget(
      value: chatAsync,
      data: (chat) => chat == null
          ? EmptyPlaceholderWidget(message: 'Chat not found'.hardcoded)
          : ChatDetails(chat: chat),
    );
  }
}

class ChatDetails extends ConsumerWidget {
  const ChatDetails({super.key, required this.chat});
  final Chat chat;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.read(authRepositoryProvider).currentUser;
    final companionId = chat.userIds.firstWhere((id) => id != user?.uid);
    final companion = ref.watch(fetchUserProvider(companionId)).value;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: ChatAppBar(companion: companion),
      body: ChatBody(chatId: chat.chatId, companion: companion),
    );
  }
}

class ChatBody extends ConsumerWidget {
  const ChatBody({super.key, required this.chatId, required this.companion});

  final String chatId;
  final AppUser? companion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messagesAsync = ref.watch(listMessageStreamProvider(chatId));

    return Stack(
      children: [
        Column(
          children: [
            SizedBox(height: MediaQuery.of(context).size.height / 10),
            CircleAvatar(
              backgroundImage: AssetImage(
                companion?.avatarUrl ?? 'assets/images/noperson.jpg',
              ),
              radius: Sizes.p80,
            ),
            gapH16,
            Text(companion?.userName ?? 'unknown'.hardcoded),
            gapH16,
            ElevatedButton(
              style: ButtonStyle(
                shape: WidgetStatePropertyAll(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(Sizes.p10),
                  ),
                ),
              ),
              onPressed: () {},
              child: Text(
                'View profile'.hardcoded,
                style: TextStyle(color: AppColors.primaryColor),
              ),
            ),
            Expanded(
              child: AsyncValueWidget(
                value: messagesAsync,
                data: (messages) => ListView.builder(
                  itemCount: messages.length,
                  itemBuilder: (BuildContext context, int index) {
                    final message = messages[index];
                    return Container(
                      alignment: message.senderId != companion?.uid
                          ? Alignment.centerRight
                          : Alignment.centerLeft,
                      color: Colors.purple,
                      child: Column(
                        children: [
                          Text(message.contentData),
                          Text(ref.read(timeAtProvider(message.timeStamp))),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),

        Align(alignment: Alignment.bottomCenter, child: ChatTextField()),
      ],
    );
  }
}

class ChatTextField extends ConsumerStatefulWidget {
  const ChatTextField({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ChatTextFieldState();
}

class _ChatTextFieldState extends ConsumerState<ChatTextField> {
  final _controller = TextEditingController();

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(Sizes.p8),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            prefixIcon: Padding(
              padding: const EdgeInsets.all(Sizes.p4),
              child: IconButton.filled(
                onPressed: () {},
                icon: Icon(
                  Icons.camera_alt_rounded,
                  color: AppColors.primaryLightColor,
                ),
              ),
            ),
            suffixIcon: Padding(
              padding: const EdgeInsets.symmetric(horizontal: Sizes.p8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                children: [
                  ChatMessageActionButton(
                    onTap: () {},
                    child: Icon(Icons.mic_none),
                  ),
                  ChatMessageActionButton(
                    onTap: () {},
                    child: Icon(Icons.photo_size_select_actual_rounded),
                  ),
                  ChatMessageActionButton(
                    onTap: () {},
                    child: Icon(Icons.sentiment_satisfied_alt_rounded),
                  ),
                  ChatMessageActionButton(
                    onTap: () {},
                    child: Icon(Icons.add_circle_outline_outlined),
                  ),
                ],
              ),
            ),
            hintText: 'Message...'.hardcoded,
            filled: true,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(Sizes.p24),
              borderSide: BorderSide.none,
            ),
          ),
        ),
      ),
    );
  }
}

class ChatMessageActionButton extends StatelessWidget {
  const ChatMessageActionButton({
    super.key,
    required this.child,
    this.padding = const EdgeInsets.all(Sizes.p4),
    required this.onTap,
  });

  final Widget child;
  final EdgeInsets padding;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: GestureDetector(onTap: onTap, child: child),
    );
  }
}

class ChatAppBar extends ConsumerWidget implements PreferredSizeWidget {
  const ChatAppBar({super.key, required this.companion});
  final AppUser? companion;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return AppBar(
      leading: BackButton(
        onPressed: () => context.goNamed(AppRoute.direct.name),
      ),
      title: ListTile(
        leading: CircleAvatar(
          backgroundImage: AssetImage(
            companion?.avatarUrl ?? 'assets/images/noperson.jpg',
          ),
        ),
        title: Text(companion?.userName ?? 'unknown'.hardcoded),
        subtitle: Text('status'.hardcoded),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(60.0);
}
