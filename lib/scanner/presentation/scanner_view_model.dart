import 'package:scan_me/common/base_view_model.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/services/catalogue_service.dart';
import 'package:scan_me/services/dto/catalogue_response.dart';

class ScannerViewModel extends BaseViewModel {

  final CatalogueService catalogueService;

  String appBarTitle = "Scan Me";

  ScannerViewModel(this.catalogueService) : super(Starting());

  @override
  void handleSideEffects(_state) async {
    super.handleSideEffects(_state);
    if (_state is Starting) {
      CatalogueResponse response = await onScanResult("9780099590088");
      print("~~~ $response");
    }
  }

  Future<CatalogueResponse> onScanResult(String barcode) async {
    setState(Loading());
    return catalogueService.fetchItem(barcode);
  }
}