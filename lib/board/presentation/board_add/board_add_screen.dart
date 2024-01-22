import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/board/presentation/board_add/board_add_view_model.dart';

class BoardAddScreen extends StatefulWidget {
  const BoardAddScreen({super.key});

  @override
  State<BoardAddScreen> createState() => _BoardAddScreenState();
}

class _BoardAddScreenState extends State<BoardAddScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<BoardAddViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('게시물 추가'),
      ),
      body: Column(
        children: [
          TextField(
            controller: _textController,
            onChanged: (value) {
              viewModel.title = value;
            },
          ),
          ElevatedButton(
            onPressed: () => viewModel.selectImage(),
            child: const Text('이미지 선택'),
          ),
          viewModel.image == null
              ? Image.network(
                  'https://cdnimg.melon.co.kr/cm2/artistcrop/images/002/61/143/261143_20210325180240_org.jpg?61e575e8653e5920470a38d1482d7312/melon/optimize/90',
                  width: 200,
                )
              : Image.memory(
                  viewModel.image!,
                  width: 200,
                ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.addPost(),
        child: const Text('추가'),
      ),
    );
  }
}
