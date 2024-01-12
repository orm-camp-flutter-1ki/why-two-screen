import 'dart:math';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:why_two_screen/ui/detail/detail_screen.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/ui/main/main_view_model.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Main Screen'),
        actions: [
          IconButton(
            // onPressed: () async {
            //   // 다른 화면
            //   Color returnColor = await Navigator.push(
            //     context,
            //     MaterialPageRoute(builder: (context) => DetailScreen(viewModel.color)),
            //   );
            //
            //   // setState(() {
            //     viewModel.color = returnColor;
            //   // });
            // },
            onPressed: () {
              context.go('/detailScreen', extra: viewModel.color);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          viewModel.setColor();
        },
        child: Container(
          color: viewModel.color,
        ),
      ),
    );
  }
}
