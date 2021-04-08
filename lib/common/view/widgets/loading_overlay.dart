import 'package:flutter/material.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:scan_me/common/view/colors.dart';

const Color TRANSPARENT_BLACK = Color(0x52000000);

class ScanMeLoadingOverlay extends StatelessWidget {
  final Widget child;
  final bool isLoading;

  const ScanMeLoadingOverlay({Key key, @required this.child, @required this.isLoading}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LoadingOverlay(
      color: TRANSPARENT_BLACK,
      progressIndicator: CircularProgressIndicator(
        valueColor: AlwaysStoppedAnimation<Color>(AppColors.BLUE),
      ),
      child: child,
      isLoading: isLoading,
    );
  }
}
