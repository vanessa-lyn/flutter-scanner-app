import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/form/presentation/form_view_model.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';

class FormPage extends StatelessWidget {

  final ScannerItem scannerItem;

  const FormPage({Key key, @required this.scannerItem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormViewModel>(
      create: (context) => FormViewModel(
          scannerItem
      ),
      child: Consumer<FormViewModel>(
        builder: (context, model, _) => Scaffold(
            body: Center(
              child: Column(
                children: [
                  Text(model.title),
                  Text(model.imageUrl),
                  Text(model.formattedPrice),
                  Text(model.quantity.toString()),
                  Text(model.description),
                ],
              )
            )
        ),
      ),
    );
  }
}