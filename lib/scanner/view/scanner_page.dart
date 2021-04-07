import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/common/view_state.dart';
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
          body: _getBody(model.state)
        ),
      ),
    );
  }

  Widget _getBody(ViewState state) {
    if (state is Loading) {
      return Center(
        child: CircularProgressIndicator()
      );
    } else {
      return Center(
        child: Text("Scanner Page"),
      );
    }
  }
}
