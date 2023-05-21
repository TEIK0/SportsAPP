import 'package:flutter/material.dart';

class UiProvider extends ChangeNotifier {
  int _selectedMenuOp = 0;

  int get selectedMenuOp {
    return this._selectedMenuOp;
  }

  set selectedMenuOp(int i) {
    this._selectedMenuOp = i;
    notifyListeners();
  }
}
