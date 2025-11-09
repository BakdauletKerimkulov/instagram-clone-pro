import 'package:flutter/material.dart';
import 'package:instagram_clone_pro/src/localization/string_hardcoded.dart';

class PlaceholderPage extends StatelessWidget {
  const PlaceholderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(child: Text('The page is coming soon'.hardcoded)),
    );
  }
}
