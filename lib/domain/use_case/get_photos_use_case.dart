import 'dart:math';
import 'package:why_two_screen/domain/repository/photo_api_repository.dart';

import '../model/photo.dart';

class GetPhotosUseCase {
  final PhotoApiRepository repository;

  GetPhotosUseCase(this.repository);

  Future<List<Photo>> execute(String query) async {
    final result = await repository.getData(query);
    return result.sublist(0, min(3, result.length));
  }
}