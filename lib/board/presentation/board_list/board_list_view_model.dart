import 'package:flutter/material.dart';

import '../../domain/model/post.dart';
import '../../domain/repository/post_repository.dart';

class BoardListViewModel extends ChangeNotifier {
  final PostRepository _postRepository;

  Stream<List<Post>> get postsStream => _postRepository.getPostsStream();

  List<Post> posts = [];

  BoardListViewModel({
    required PostRepository postRepository,
  }) : _postRepository = postRepository {
    postsStream.listen((newPosts) {
      posts = newPosts;
      notifyListeners();
    });
  }
}
