import 'package:dio/dio.dart';
import 'package:why_two_screen/fake_data.dart';
import 'package:why_two_screen/list_screen/photo_repository.dart';

import 'list_screen.dart';

class PhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos() async {
    // 날씨가 흐리면 10개, 맑으면 20개

    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/photos');

    final jsonMapList = response.data;

    return jsonMapList.map((e) => Photo.fromMap(e)).toList();
  }
}


class MockPhotoRepositoryImpl implements PhotoRepository {
  @override
  Future<List<Photo>> getPhotos() async {
    // 날씨가 흐리면 10개, 맑으면 20개

    final jsonMapList = fakeData;

    return jsonMapList.map((e) => Photo.fromMap(e)).toList();
  }
}

abstract class A {
  int a = 10;

  void aaa();

  void bbb() {

  }
}

abstract interface class B {
  void aaa();
  void bbb();
}