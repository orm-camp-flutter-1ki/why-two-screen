import 'package:dio/dio.dart';

import 'list_screen.dart';

class PhotoRepository {
  Future<List<Photo>> getPhotos() async {
    // 날씨가 흐리면 10개, 맑으면 20개

    final dio = Dio();
    final response =
    await dio.get('https://jsonplaceholder.typicode.com/photos');

    final jsonMapList = response.data;

    return jsonMapList.map((e) => Photo.fromMap(e)).toList();
  }

}