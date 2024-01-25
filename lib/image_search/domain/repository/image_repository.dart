import 'package:why_two_screen/image_search/domain/model/image_model.dart';

abstract interface class ImageRepository {
  Future<List<ImageModel>> getImageModels();
}