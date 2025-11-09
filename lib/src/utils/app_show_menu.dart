import 'package:flutter/material.dart';

void appShowMenu({
  required BuildContext context,
  required List<PopupMenuItem<String>> items,
  required void Function(String?) onSelected,
}) {
  if (items.isEmpty || !context.mounted) return;

  final renderBox = context.findRenderObject() as RenderBox;
  final offset = renderBox.localToGlobal(Offset.zero);
  final size = renderBox.size;

  showMenu<String>(
    context: context,
    position: RelativeRect.fromLTRB(
      offset.dx,
      offset.dy + size.height,
      offset.dx,
      offset.dy,
    ),
    items: items,
  ).then((value) {
    if (context.mounted) {
      onSelected(value);
    }
  });
}
