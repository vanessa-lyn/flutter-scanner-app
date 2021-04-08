import 'package:scan_me/form/data/repository/selling_result.dart';

class SuccessViewState {
  final String header;
  final SellingResult sellingResult;
  final String scanButtonText;
  final String viewListingsButtonText;

  SuccessViewState(this.header, this.sellingResult, this.scanButtonText, this.viewListingsButtonText);
}