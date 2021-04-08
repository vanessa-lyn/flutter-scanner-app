import 'package:flutter/material.dart';
import 'package:scan_me/common/view/colors.dart';

const double BUTTON_HEIGHT = 60;

class ScanMeButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  const ScanMeButton({this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BUTTON_HEIGHT,
      width: double.infinity,
      child: TextButton(
        onPressed: () {
          onPressed();
        },
        child: Text(buttonText),
        style: TextButton.styleFrom(
          primary: Colors.white,
          backgroundColor: AppColors.BLUE
        ),
      ),
    );
  }
}
