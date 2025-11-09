// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

class CommentsItemBuilder extends StatelessWidget {
  const CommentsItemBuilder({
    super.key,
    required this.itemCount,
    required this.itemBuilder,
    this.shrinkWrap = false,
    this.physics = false,
  });

  final int itemCount;

  final Widget Function(BuildContext, int) itemBuilder;

  final bool shrinkWrap;
  final bool physics;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: physics ? const NeverScrollableScrollPhysics() : null,
      itemCount: itemCount,
      itemBuilder: itemBuilder,
    );
  }
}
