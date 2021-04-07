import 'package:flutter/material.dart';
import 'package:scan_me/common/view/colors.dart';


class TextHeader extends StatelessWidget {
  final String text;

  const TextHeader({this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      'Great, let\'s get a few\n more details.',
      style: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
