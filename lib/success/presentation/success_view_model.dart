import 'package:scan_me/common/base_view_model.dart';
import 'package:scan_me/common/view_state.dart';
import 'package:scan_me/form/data/repository/selling_result.dart';
import 'package:scan_me/success/presentation/success_mapper.dart';
import 'package:scan_me/success/presentation/success_view_state.dart';

class SuccessViewModel extends BaseViewModel {

  final SellingResult _sellingResult;
  
  SuccessViewState viewState;

  SuccessViewModel(this._sellingResult) : super(Rest()) {
    viewState = SuccessMapper.map(_sellingResult);
  }
}
