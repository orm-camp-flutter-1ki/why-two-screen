import 'package:flutter/material.dart';
import 'package:why_two_screen/list_screen/photo_repository.dart';

import 'list_screen.dart';

class ListViewModel extends ChangeNotifier {
  final repository = PhotoRepository();

  List<String> items = []; // List
  bool isLoading = false; // 로딩

  List<Photo> photos = [];

  Future<void> printFather() async {
    // 로딩 3초 하고
    isLoading = true;
    items = [];

    notifyListeners();

    // 미래에 3초 후에 끝날 동작
    await Future.delayed(const Duration(seconds: 3));

    // 결과 보여주자
    isLoading = false;

    photos = await repository.getPhotos();
    notifyListeners();
  }


}
