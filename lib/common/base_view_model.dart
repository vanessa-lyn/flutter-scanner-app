import 'package:flutter/foundation.dart';

class BaseViewModel<T> with ChangeNotifier {

  String tag;

  T _state;
  T get state => _state;

  BaseViewModel(T viewState, [String tag = ""]) {
    this.tag = tag;
    setState(viewState);
  }

  void setState(T viewState) {
    _state = viewState;
    notifyListeners();
    handleSideEffects(state);
  }

  @protected
  void handleSideEffects(T _state) {
    print("$tag: handles side effects for: $_state");
  }

  @protected
  void handleError(Object e) {
    print(e);
  }
}