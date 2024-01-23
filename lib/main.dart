import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/board/data/repository/post_repository_impl.dart';

import 'board/domain/repository/post_repository.dart';
import 'board/presentation/board_list/board_list_screen.dart';
import 'board/presentation/board_list/board_list_view_model.dart';
import 'firebase_options.dart';

late PostRepository postRepository;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  postRepository = PostRepositoryImpl();

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
        create: (_) => BoardListViewModel(
          postRepository: postRepository,
        ),
        child: const BoardListScreen(),
      ),
    );
  }
}
