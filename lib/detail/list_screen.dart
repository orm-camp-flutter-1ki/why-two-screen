import 'package:flutter/material.dart';

class ListScreen extends StatelessWidget {
  const ListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.list_alt),
          ),
        ],
      ),
      body: Container(),
    );
  }
}
