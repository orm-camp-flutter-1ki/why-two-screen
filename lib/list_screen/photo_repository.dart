import 'list_screen.dart';

abstract interface class PhotoRepository {
  Future<List<Photo>> getPhotos();
}