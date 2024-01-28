import 'package:flutter/cupertino.dart';
import '../data/pixabay_api.dart';
import '../model/photo.dart';

class FinalScreenViewModel with ChangeNotifier {
  final pixabayApi = PixabayApi();

  List<Photo> _items = [];
  bool _isLoading = false;

  List<Photo> get items => _items;

  set items(List<Photo> value) {
    _items = value;
    notifyListeners();
  }

  bool get isLoading => _isLoading;

  Future<void> loadIcon(String query) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    final items = await pixabayApi.getData(query);
    _items = items;
    _isLoading = false;
    notifyListeners();
  }
}
