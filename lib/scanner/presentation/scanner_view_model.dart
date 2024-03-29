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
    List<AmazonCategories> categories = result.offers[0].marketSpecificData.amazonCategories;
    String category = categories[0].name;

    String categoryPath = "";
    for (var i = 1; i < categories.length; i++) {
      categoryPath += categories[i].name;
      if (i < categories.length - 1) {
        categoryPath += " > ";
      }
    }

    return ScannerItem(
      result.itemDetails.titles.en,
      result.itemDetails.imageUrl,
      result.itemDetails.msrp.amount,
      category,
      categoryPath,
    );
  }
}
