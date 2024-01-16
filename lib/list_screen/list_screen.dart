import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _nameController = TextEditingController();
  final _countController = TextEditingController();
  List<String> _items = [];

  @override
  void dispose() {
    _nameController.dispose();
    _countController.dispose();
    super.dispose();
  }

  void printFather() {
    final int count = int.tryParse(_countController.text) ?? 0;

    _items = [];
    for (int i = 0; i < count; i++) {
      _items.add(_nameController.text);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('아버지가 3명'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _countController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    printFather();
                  });
                },
                child: const Text('출력'),
              ),
            ],
          ),
          Expanded(
            child: ListView(
              children: _items
                  .map((e) => ListTile(
                        title: Text(e),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
