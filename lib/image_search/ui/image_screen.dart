import 'package:flutter/material.dart';

import 'image_view_model.dart';

class ImageScreen extends StatelessWidget {
  final Listenable listenable;

  const ImageScreen({
    super.key,
    required this.listenable,
  });

  @override
  Widget build(BuildContext context) {
    final viewModel = listenable as ImageViewModel;
    return Scaffold(
      appBar: AppBar(
        title: const Text('의존성'),
      ),
      body: ListView(
        children:
            viewModel.images.map((e) => Image.network(e.imageUrl)).toList(),
      ),
    );
  }
}
