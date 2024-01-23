import 'dart:typed_data';

import 'package:flutter/material.dart';

import '../../domain/image_selector/image_selector.dart';
import '../../domain/model/post.dart';
import '../../domain/repository/post_repository.dart';

class BoardAddViewModel extends ChangeNotifier {
  final ImageSelector _imageSelector;
  final PostRepository _postRepository;

  BoardAddViewModel({
    required ImageSelector imageSelector,
    required PostRepository postRepository,
  })  : _imageSelector = imageSelector,
        _postRepository = postRepository;

  String title = '';

  Uint8List? image;

  Future<void> selectImage() async {
    image = await _imageSelector.pickImage();
    notifyListeners();
  }

  Future<void> addPost() async {
    if (title.isEmpty || image == null) {
      return;
    }

    await _postRepository.addPost(title, image!);
  }
}
