import 'package:scan_me/common/base_view_model.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/scanner/data/scanner_item.dart';
import 'package:scan_me/services/catalogue_service.dart';
import 'package:scan_me/services/dto/catalogue_response.dart';

class ScannerViewModel extends BaseViewModel {
  final CatalogueService catalogueService;

  ScannerViewModel(this.catalogueService) : super(Starting());

  Future<ScannerItem> onScanResult(String barcode) async {
    setState(Loading());
    CatalogueResponse response = await catalogueService.fetchItem(barcode);
    return response.toScannerItem();
  }
}

extension CatalogueResponseExtensions on CatalogueResponse {
  ScannerItem toScannerItem() {


    // secondCategory =  if (result.offers[1] != null) {result.offers[1]};

    return ScannerItem(
      result.itemDetails.titles.en,
      result.itemDetails.imageUrl,
      result.itemDetails.msrp.amount,
      result.offers[0].marketSpecificData.amazonCategories[0].name,
      result.offers[0].marketSpecificData.amazonCategories
    );
  }
}
