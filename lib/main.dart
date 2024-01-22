import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/board/data/image_selector/image_selector_impl.dart';
import 'package:why_two_screen/board/data/repository/post_repository_impl.dart';
import 'package:why_two_screen/board/presentation/board_add/board_add_screen.dart';
import 'package:why_two_screen/main/main_screen.dart';

import 'board/presentation/board_add/board_add_view_model.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ChangeNotifierProvider(
        create: (_) => BoardAddViewModel(
          imageSelector: ImageSelectorImpl(),
          postRepository: PostRepositoryImpl(),
        ),
        child: const BoardAddScreen(),
      ),
    );
  }
}
