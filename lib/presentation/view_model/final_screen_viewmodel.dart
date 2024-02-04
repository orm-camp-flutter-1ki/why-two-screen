import 'package:flutter/cupertino.dart';
import 'package:why_two_screen/data/data_source/result.dart';
import 'package:why_two_screen/data/repository/photo_api_repository_impl.dart';
import 'package:why_two_screen/presentation/view_model/final_screen_state.dart';

import '../../domain/model/photo.dart';

class FinalScreenViewModel with ChangeNotifier {
  final PhotoApiRepositoryImpl repository;

  FinalScreenViewModel(this.repository);

  FinalScreenState _state = FinalScreenState([], false);

  FinalScreenState get state => _state;


  Future<void> loadIcon(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 3));
    final List<Photo>items = await repository.getData(query);

          _state = state.copyWith(items: items);
    notifyListeners();

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
