import 'package:why_two_screen/domain/model/photo.dart';

abstract class PhotoApiRepository {
  Future<List<Photo>> getData(String query);
}