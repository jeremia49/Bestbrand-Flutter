import 'package:flutter/material.dart';

class MenuProvider with ChangeNotifier {
  int _menu = 0;
  int get menu => _menu;
  void setMenu(int value) {
    _menu = value;
    notifyListeners();
  }
}
