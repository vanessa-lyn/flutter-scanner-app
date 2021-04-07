import 'package:scan_me/common/base_view_model.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/services/catalogue_service.dart';

class ScannerViewModel extends BaseViewModel {

  final CatalogueService catalogueService;

  ScannerViewModel(this.catalogueService) : super(Rest());

  void onScanResult(String barcode) async {
    setState(Loading());
    catalogueService.fetchItem(barcode);
    setState(Rest());
  }

}