import 'dart:typed_data';

import '../model/post.dart';

abstract interface class PostRepository {
  Future<List<Post>> getPosts();

  Future<void> addPost(String title, Uint8List image);
}
