import 'package:intl/intl.dart';
import 'package:scan_me/common/base_view_model.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';

class FormViewModel extends BaseViewModel {

  final ScannerItem _scannerItem;

  String title = "";
  String imageUrl = "";
  String formattedPrice = "";
  int quantity = 1;
  String description = "";

  FormViewModel(this._scannerItem) : super(Rest()) {
    // initialize state
    title = _scannerItem.title;
    imageUrl = _scannerItem.imageUrl;

    final currencyFormatter = new NumberFormat("#,##0.00", "en_US");
    formattedPrice = currencyFormatter.format(_scannerItem.price);
  }

}