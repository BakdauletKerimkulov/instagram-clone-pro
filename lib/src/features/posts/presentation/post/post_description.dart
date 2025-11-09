import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:instagram_clone_pro/src/constants/app_sizes.dart';
import 'package:instagram_clone_pro/src/utils/format_time.dart';

class DescriptionText extends StatefulWidget {
  final String username;
  final String text;
  final int maxLines;
  final DateTime createdAt;

  const DescriptionText({
    required this.username,
    required this.text,
    required this.createdAt,
    this.maxLines = 5,
    super.key,
  });

  @override
  State<DescriptionText> createState() => _DescriptionTextState();
}

class _DescriptionTextState extends State<DescriptionText> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Sizes.p16,
        right: Sizes.p16,
        bottom: Sizes.p24,
      ),
      child: GestureDetector(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            RichText(
              maxLines: isExpanded ? null : widget.maxLines,
              overflow: isExpanded
                  ? TextOverflow.visible
                  : TextOverflow.ellipsis,
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 16.0),
                children: [
                  TextSpan(
                    text: "${widget.username} ",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: '${widget.text} '),
                  if (widget.text.length > 100)
                    TextSpan(
                      text: isExpanded ? 'less' : 'more...',
                      style: TextStyle(color: Colors.grey),
                    ),
                ],
              ),
            ),
            gapH12,
            Consumer(
              builder: (context, ref, _) {
                final formatTime = ref.watch(formatTimeProvider);
                return Text(formatTime(widget.createdAt));
              },
            ),
          ],
        ),
      ),
    );
  }
}
