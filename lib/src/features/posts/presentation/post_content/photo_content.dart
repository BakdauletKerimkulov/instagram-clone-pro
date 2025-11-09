// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/common_widgets/app_circular_progress_indicator.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class PhotoContent extends ConsumerWidget {
  const PhotoContent({required this.mediaUrl, super.key});

  final String mediaUrl;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CachedNetworkImage(
      imageUrl: mediaUrl,
      fit: BoxFit.cover,
      placeholder: (context, url) =>
          Center(child: AppCircularProgressIndicator()),
      errorWidget: (context, url, object) =>
          Text('Something is wrong: ${object.toString()}'.hardcoded),
    );
  }
}
