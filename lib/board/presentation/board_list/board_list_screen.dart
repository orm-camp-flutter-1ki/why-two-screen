import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/board/presentation/board_list/board_list_view_model.dart';

import '../../../main.dart';
import '../../data/image_selector/image_selector_impl.dart';
import '../../data/repository/post_repository_impl.dart';
import '../board_add/board_add_screen.dart';
import '../board_add/board_add_view_model.dart';

class BoardListScreen extends StatelessWidget {
  const BoardListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BoardListViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('이미지 리스트'),
      ),
      body: ListView(
        children: viewModel.posts
            .map((post) => ListTile(
                  leading: Image.network(post.imageUrl!),
                  title: Text(post.title),
                ))
            .toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => ChangeNotifierProvider(
                create: (_) => BoardAddViewModel(
                  imageSelector: ImageSelectorImpl(),
                  postRepository: postRepository,
                ),
                child: const BoardAddScreen(),
              ),
            ),
          );
        },
        child: const Text('+'),
      ),
    );
  }
}
