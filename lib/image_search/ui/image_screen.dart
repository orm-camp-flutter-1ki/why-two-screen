import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'image_view_model.dart';

class ImageScreen extends StatelessWidget {
  const ImageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ImageViewModel>();
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
