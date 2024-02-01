import 'package:flutter/cupertino.dart';
import 'package:why_two_screen/data/repository/photo_api_repository_impl.dart';

import '../../domain/model/photo.dart';

class FinalScreenViewModel with ChangeNotifier {
  final PhotoApiRepositoryImpl repository;

  FinalScreenViewModel(this.repository);

  List<Photo> _items = [];

  List<Photo> get items => _items;

  set items(List<Photo> value) {
    _items = value;
    notifyListeners();
  }

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  Future<void> loadIcon(String query) async {
    _isLoading = true;
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    final items = await repository.getData(query);
    _items = items;
    _isLoading = false;
    notifyListeners();
  }
}
