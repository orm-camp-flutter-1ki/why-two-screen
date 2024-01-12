import 'package:flutter/material.dart';

class DetailViewModel extends ChangeNotifier {
  Color _bottomColor = Colors.white;

  Color get bottomColor => _bottomColor;

  set bottomColor(Color newColor) {
    _bottomColor = newColor;
    notifyListeners();
  }
}
