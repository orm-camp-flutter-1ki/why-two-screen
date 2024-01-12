import 'package:flutter/material.dart';
import '../second/second_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('첫번째 화면'),
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          ),
        ],
      ),
      body: const Center(
          child: Text(
        '처음 화면',
        style: TextStyle(fontSize: 20),
      )),
    );
  }
}
