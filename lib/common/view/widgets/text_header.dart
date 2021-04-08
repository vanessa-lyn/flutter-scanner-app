import 'package:flutter/material.dart';
import 'package:scan_me/common/view/colors.dart';


class TextHeader extends StatelessWidget {
  final String text;

  const TextHeader({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Great, let\'s get a few\nmore details.',
      style: TextStyle(
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
