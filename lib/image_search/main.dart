import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/image_search/data/data_source/image_api_impl.dart';
import 'package:why_two_screen/image_search/data/repository/image_repository_impl.dart';
import 'package:why_two_screen/image_search/ui/image_view_model.dart';

import 'di/di_setup.dart';
import 'ui/image_screen.dart';
import 'ui/second_view_model.dart';

void main() async {
  setup();
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
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => getIt<ImageViewModel>(),
          ),
        ],
        child: const ImageScreen(),
      ),
    );
  }
}
