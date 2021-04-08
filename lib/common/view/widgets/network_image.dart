import 'package:flutter/material.dart';
import 'package:scan_me/common/view/colors.dart';

class ScanMeImage extends StatelessWidget {

  final String imageUrl;

  const ScanMeImage({Key key, this.imageUrl}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: AppColors.GREY,
            width: 1,
          ),
          color: AppColors.LIGHTGREY,
        ),
        child: Image.network(
          imageUrl,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}