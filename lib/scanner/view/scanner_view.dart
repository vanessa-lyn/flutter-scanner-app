import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/app_router.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';
import 'package:scan_me/scanner/presentation/scanner_view_model.dart';

class ScannerView extends StatefulWidget {
  @override
  _ScannerViewState createState() => _ScannerViewState();
}

class _ScannerViewState extends State<ScannerView> {
  @override
  void initState() {
    super.initState();
    scanBarcodeNormal();
  }

  Future<void> scanBarcodeNormal() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );

      ScannerViewModel model = Provider.of<ScannerViewModel>(context, listen: false);
      ScannerItem scannerItem = await model.onScanResult(barcodeScanRes);

      Navigator.pushNamed(context, formRoute, arguments: scannerItem);
    } on PlatformException {
      throw Exception("There was an issue scanning");
    }

    if (!mounted) return;
  }

  @override
  Widget build(BuildContext context) {
    // We're just using a Stateful widget to kick off the scanner. This widget doesn't have UI.
    return Scaffold();
  }
}
