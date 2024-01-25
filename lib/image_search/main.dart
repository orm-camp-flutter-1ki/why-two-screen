import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/board/data/repository/post_repository_impl.dart';
import 'package:why_two_screen/image_search/data/data_source/image_api_impl.dart';
import 'package:why_two_screen/image_search/data/repository/image_repository_impl.dart';
import 'package:why_two_screen/image_search/ui/image_view_model.dart';

import 'ui/image_screen.dart';

void main() async {
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
        create: (_) => ImageViewModel(
          ImageRepositoryImpl(
              ImageApiImpl()
          ),
        ),
        child: const ImageScreen(),
      ),
    );
  }
}
