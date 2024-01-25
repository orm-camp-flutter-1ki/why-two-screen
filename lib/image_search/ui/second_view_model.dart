import 'package:flutter/material.dart';
import 'package:why_two_screen/image_search/domain/model/image_model.dart';

import '../domain/repository/image_repository.dart';

class SecondViewModel extends ChangeNotifier {
  ImageRepository imageRepository;

  List<ImageModel> images = [];

  SecondViewModel(this.imageRepository);

  Future<void> fetchImages() async {
    images = (await imageRepository.getImageModels()).take(3).toList();
    notifyListeners();
  }
}