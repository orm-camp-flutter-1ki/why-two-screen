import 'package:flutter/cupertino.dart';

import '../data/pixabay_api.dart';
import '../model/photo.dart';

class FinalScreenViewModel extends ChangeNotifier {
  final pixabayApi = PixabayApi();
  List<Photo> _items = [];
  bool _isLoading = false;

  get items => _items;

  get isLoading => _isLoading;

  Future<void> loadIcon() async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));

    final items = await pixabayApi.getData('rose');
    _items = items;
    _isLoading = false;
    notifyListeners();
  }
}
