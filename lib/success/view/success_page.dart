import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/scanner/presentation/scanner_view_model.dart';
import 'package:scan_me/success/presentation/success_view_model.dart';

class SuccessPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SuccessViewModel>(
      create: (context) => SuccessViewModel(),
      child: Consumer<ScannerViewModel>(
        builder: (context, model, _) => Scaffold(
            body: Center()
        ),
      ),
    );
  }
}