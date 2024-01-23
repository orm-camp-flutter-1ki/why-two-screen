import 'dart:async';

import 'package:flutter/material.dart';

import '../../domain/model/post.dart';
import '../../domain/repository/post_repository.dart';

class BoardListViewModel extends ChangeNotifier {
  final PostRepository _postRepository;

  StreamSubscription<List<Post>>? _subscription;

  Stream<List<Post>> get postsStream => _postRepository.getPostsStream();

  List<Post> posts = [];

  BoardListViewModel({
    required PostRepository postRepository,
  }) : _postRepository = postRepository {
    _subscription = postsStream.listen((newPosts) {
      posts = newPosts;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
