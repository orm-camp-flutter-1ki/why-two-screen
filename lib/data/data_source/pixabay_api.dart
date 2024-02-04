import 'dart:convert';
import 'package:http/http.dart' as http;


class PixabayApi {
static const baseUrl = 'https://pixabay.com/api/';
static const key = '41487259-59b1e614313376c6d9c201e9c';


  Future<List> getData(String query) async {
      final response = await http.get(Uri.parse('$baseUrl?key=$key&q=$query&image_type=photo'));
      Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse['hits'];
  }
}
