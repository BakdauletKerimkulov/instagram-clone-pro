import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/utils/format_time.dart';

class PostHeader extends StatelessWidget {
  const PostHeader({
    super.key,
    this.avatarUrl,
    required this.userName,
    required this.createdAt,
  });

  final String? avatarUrl;
  final String userName;
  final DateTime createdAt;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, top: 4.0, bottom: 4.0),
      child: Row(
        children: [
          CircleAvatar(
            radius: 20,
            backgroundImage: avatarUrl != null ? AssetImage(avatarUrl!) : null,
            //CachedNetworkImageProvider('https://i.redd.it/krp6tpdwcmgc1.jpeg',),
            backgroundColor: Colors.grey[200],
            child: Icon(Icons.person),
          ),
          gapW16,
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(userName, style: TextStyle(fontSize: 20.0)),
              Consumer(
                builder: (context, ref, _) {
                  final formatTime = ref.read(formatTimeProvider);
                  return Text(formatTime(createdAt));
                },
              ),
            ],
          ),
          Spacer(),
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              'assets/icons/ellipsis-v-icon.svg',
              height: 20,
              width: 20,
            ),
          ),
        ],
      ),
    );
  }
}
