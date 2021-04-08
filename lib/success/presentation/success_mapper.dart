import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/success/presentation/success_view_state.dart';

class SuccessMapper {
  static SuccessViewState map(SellingResult sellingResult) {
    return SuccessViewState(
      "Great, that listing is live and available for purchase.",
      sellingResult,
      "Scan another item",
      "View your live listings",
    );
  }
}
