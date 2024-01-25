import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/image_search/ui/second_view_model.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<SecondViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('두번 째'),
      ),
      body: Container(),
    );
  }
}
