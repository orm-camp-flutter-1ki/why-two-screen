import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../fake_data.dart';
import 'list_screen.dart';

class ListViewModel extends ChangeNotifier {
  List<String> items = []; // List
  bool isLoading = false; // 로딩

  var _jsonMapList = []; // List<dynamic>

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

    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/photos');

    // _jsonMapList = response.data;
    _jsonMapList = fakeData;

    photos = _jsonMapList.map((e) => Photo.fromMap(e)).toList();
    notifyListeners();
  }
}
