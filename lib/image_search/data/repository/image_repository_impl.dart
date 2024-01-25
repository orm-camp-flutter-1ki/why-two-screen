import 'package:why_two_screen/image_search/domain/model/image_model.dart';
import 'package:why_two_screen/image_search/domain/repository/image_repository.dart';

import '../data_source/image_api.dart';

class ImageRepositoryImpl implements ImageRepository {
  ImageApi api;

  ImageRepositoryImpl(this.api);

  @override
  Future<List<ImageModel>> getImageModels() async {
    final jsonList = await api.getImage();
    return jsonList
        .map((e) => ImageModel(imageUrl: e['thumbnailUrl']))
        .toList();
  }
}
