import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({Key? key}) : super(key: key);

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _nameController = TextEditingController();
  final _countController = TextEditingController();
  List<String> _items = []; // List
  bool _isLoading = false; // 로딩

  @override
  void dispose() {
    _nameController.dispose();
    _countController.dispose();
    super.dispose();
  }

  Future<void> printFather() async {
    setState(() {
      // 로딩 3초 하고
      _isLoading = true;
      _items = [];
    });

    // 미래에 3초 후에 끝날 동작
    await Future.delayed(const Duration(seconds: 3));

    // 결과 보여주자
    setState(() {
      _isLoading = false;

      final int count = int.tryParse(_countController.text) ?? 0;

      for (int i = 0; i < count; i++) {
        _items.add(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6BxZxbIpcJxdkEAP0S9f-6X7-eVOI0d72wA&usqp=CAU'); // Replace with your image URL
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('강인이 월클 입니다.'),
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
                  printFather();
                },
                child: const Text('출력'),
              ),
            ],
          ),
          _isLoading
              ? const Center(
                  child:
                      CircularProgressIndicator(), // Show a loading indicator
                )
              : Expanded(
                  child: ListView.builder(
                    itemCount: _items.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Image.network(
                          _items[index], // Use the image URL from the list
                        ),
                      );
                    },
                  ),
                ),
        ],
      ),
    );
  }
}
