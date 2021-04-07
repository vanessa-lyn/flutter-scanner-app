import 'package:scan_me/common/base_view_model.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/services/catalogue_service.dart';
import 'package:scan_me/services/dto/catalogue_response.dart';

class ScannerViewModel extends BaseViewModel {

  final CatalogueService catalogueService;

  ScannerViewModel(this.catalogueService) : super(Starting());

  Future<CatalogueResponse> onScanResult(String barcode) async {
    print("~~~onScanResult $barcode");
    setState(Loading());
    CatalogueResponse response = await catalogueService.fetchItem(barcode);
    setState(Rest());
    print("~~~onScanResult ${response.result.itemDetails.titles.en}");
  }
}