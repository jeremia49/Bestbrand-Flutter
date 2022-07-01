import 'package:flutter/material.dart';

class NightModeProvider with ChangeNotifier {
  bool _nightmode = false;
  bool get nightmode => _nightmode;
  void setNightMode(bool value) {
    _nightmode = value;
    notifyListeners();
  }
}
