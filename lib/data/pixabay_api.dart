import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/photo.dart';

class PixabayApi {
  Future<List<Photo>> getData(String query) async {
    final response = await http.get(Uri.parse(
        'https://pixabay.com/api/?key=41487259-59b1e614313376c6d9c201e9c&q=$query&image_type=photo'));
    Map<String, dynamic> jsonResponse = jsonDecode(response.body);
    List hits = jsonResponse['hits'];
    return hits.map((e) => Photo.fromJson(e)).toList();
  }
}
