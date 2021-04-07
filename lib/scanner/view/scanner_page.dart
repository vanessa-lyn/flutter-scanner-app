import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/app_router.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';
import 'package:scan_me/scanner/presentation/scanner_view_model.dart';
import 'package:scan_me/services/catalogue_service.dart';

class ScannerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ScannerViewModel>(
      create: (context) => ScannerViewModel(
        Provider.of<CatalogueService>(context, listen: false),
      ),
      child: Consumer<ScannerViewModel>(
        builder: (context, model, _) => Scaffold(
            body: _getBody(context, model)
        ),
      ),
    );
  }

  Widget _getBody(BuildContext context, ScannerViewModel model) {
    if (model.state is Loading) {
      return Center(
          child: CircularProgressIndicator()
      );
    } else {
      scanBarcodeNormal(context);
      return Container();
    }
  }
}

Future<void> scanBarcodeNormal(BuildContext context) async {
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
}