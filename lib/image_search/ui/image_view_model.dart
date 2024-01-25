import 'package:flutter/material.dart';
import 'package:why_two_screen/image_search/domain/model/image_model.dart';

import '../domain/repository/image_repository.dart';

class ImageViewModel extends ChangeNotifier {
  ImageRepository imageRepository;

  List<ImageModel> images = [];

  ImageViewModel(this.imageRepository);

  Future<void> fetchImages() async {
    images = await imageRepository.getImageModels();
    notifyListeners();
  }
}