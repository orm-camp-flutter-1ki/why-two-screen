import 'package:why_two_screen/data/data_source/pixabay_api.dart';
import '../../domain/model/photo.dart';
import '../../domain/repository/photo_api_repository.dart';

class PhotoApiRepositoryImpl implements PhotoApiRepository {
  PixabayApi api;

  PhotoApiRepositoryImpl(this.api);

  @override
  Future<List<Photo>> getData(String query) async {
    final response = await api.getData(query);
    return response.map((e) => Photo.fromJson(e)).toList();
  }
}
