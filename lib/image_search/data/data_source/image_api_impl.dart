import 'dart:convert';

import 'package:http/http.dart' as http;

import 'image_api.dart';

class ImageApiImpl implements ImageApi {
  @override
  Future<List<dynamic>> getImage() async {
    final response = await http
        .get(Uri.parse('https://jsonplaceholder.typicode.com/photos'));

    return jsonDecode(response.body) as List;
  }
}
