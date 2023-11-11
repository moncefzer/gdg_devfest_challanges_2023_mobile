import 'package:flutter/material.dart';

class DefaultTextButton extends StatelessWidget {
  const DefaultTextButton({super.key, required this.text, required this.press});
  final String text;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: press, child: Text(text));
  }
}
