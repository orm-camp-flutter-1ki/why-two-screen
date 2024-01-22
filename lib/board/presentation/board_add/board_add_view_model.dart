import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../domain/image_selector/image_selector.dart';

class BoardAddViewModel extends ChangeNotifier {
  ImageSelector _imageSelector;

  BoardAddViewModel({
    required ImageSelector imageSelector,
  }) : _imageSelector = imageSelector;

  String title = '';

  Uint8List? image;

  Future<void> selectImage() async {
    image = await _imageSelector.pickImage();
    notifyListeners();
  }

  void addPost() {
    if (title.isEmpty || image == null) {
      return;
    }

    print(title);
  }
}
