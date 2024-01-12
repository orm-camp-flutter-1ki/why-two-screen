import 'dart:math';

import 'package:flutter/material.dart';

class MainViewModel extends ChangeNotifier {
  Color _color = Colors.yellow;

  Color get color => _color;

  set color(Color newColor) {
    _color = newColor;
    notifyListeners();
  }

  void setColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);

    final newColor = Color.fromARGB(255, red, green, blue);

    _color = newColor;
    notifyListeners();
  }
}
