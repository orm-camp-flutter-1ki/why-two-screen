import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/image_search/data/data_source/image_api.dart';
import 'package:why_two_screen/image_search/data/data_source/image_api_impl.dart';
import 'package:why_two_screen/image_search/data/repository/image_repository_impl.dart';
import 'package:why_two_screen/image_search/ui/second_screen.dart';

import '../di/di_setup.dart';
import '../main.dart';
import 'image_view_model.dart';
import 'second_view_model.dart';

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
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => ChangeNotifierProvider(
              create: (_) => getIt<SecondViewModel>(),
              child: const SecondScreen(),
            )),
          );
        },
        child: const Text('넘어가'),
      ),
    );
  }
}
