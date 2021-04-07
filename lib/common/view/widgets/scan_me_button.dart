import 'package:flutter/material.dart';
import 'package:scan_me/common/view/colors.dart';

const double BUTTON_HEIGHT = 40;

class ScanMeButton extends StatelessWidget {
  final Function onPressed;
  final String buttonText;

  const ScanMeButton({this.onPressed, this.buttonText});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: BUTTON_HEIGHT,
      width: double.infinity,
      child: FlatButton(
        color: AppColors.BLUE,
        onPressed: () {
          onPressed();
        },
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
