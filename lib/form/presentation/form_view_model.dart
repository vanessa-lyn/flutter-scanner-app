import 'package:intl/intl.dart';
import 'package:scan_me/common/base_view_model.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/form/data/repository/selling_repository.dart';
import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/form/domain/listing_template.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';

class FormViewModel extends BaseViewModel {
  final SellingRepository _sellingRepository;
  final ScannerItem _scannerItem;

  ListingTemplate listingTemplate = ListingTemplate.initial();

  FormViewModel(this._scannerItem, this._sellingRepository) : super(Rest()) {
    listingTemplate = _scannerItem.toListingTemplate();
  }

  Future<SellingResult> onStartListing() async {
    setState(Loading());
    return await _sellingRepository.startListing(listingTemplate);
  }
}

extension ScannerItemExtensions on ScannerItem {
  ListingTemplate toListingTemplate() {
    return ListingTemplate(title: title, imageUrl: imageUrl, quantity: "1", formattedPrice: "\$$price");
  }
}
