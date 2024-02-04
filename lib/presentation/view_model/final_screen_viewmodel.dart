import 'package:flutter/cupertino.dart';
import 'package:why_two_screen/domain/use_case/get_photos_use_case.dart';
import 'package:why_two_screen/presentation/view_model/final_screen_state.dart';

import '../../domain/model/photo.dart';

class FinalScreenViewModel with ChangeNotifier {
  final GetPhotosUseCase getPhotosUseCase;

  FinalScreenViewModel(this.getPhotosUseCase);

  FinalScreenState _state = FinalScreenState([], false);

  FinalScreenState get state => _state;

  Future<void> loadIcon(String query) async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    await Future.delayed(const Duration(seconds: 1));
    final List<Photo> items = await getPhotosUseCase.execute(query);

    _state = state.copyWith(items: items);
    notifyListeners();

    _state = state.copyWith(isLoading: false);
    notifyListeners();
  }
}
