import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/success/presentation/success_view_model.dart';

class SuccessPage extends StatelessWidget {
  final SellingResult sellingResult;

  const SuccessPage({Key key, this.sellingResult}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SuccessViewModel>(
      create: (context) => SuccessViewModel(sellingResult),
      child: Consumer<SuccessViewModel>(
        builder: (context, model, _) => Scaffold(
          body: Center(
            child: Text(model.viewState.sellingResult.title),
          ),
        ),
      ),
    );
  }
}
