import 'package:flutter/material.dart';
import 'package:scan_me/common/view/colors.dart';

class ScanMeCircularProgressIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.BLUE)
    );
  }
}