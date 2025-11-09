import 'package:flutter/material.dart';

void showSnackbar(BuildContext context, Widget content, {seconds = 2}) {
  final snackBar = SnackBar(
    content: content,
    duration: Duration(seconds: seconds),
  );

  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
