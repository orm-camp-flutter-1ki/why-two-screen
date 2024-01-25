import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _inputTextController = TextEditingController();
  final _countTextController = TextEditingController();
  List<String> _items = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _inputTextController.dispose();
    _countTextController.dispose();
    super.dispose();
  }

  Future<void> printInput() async {
    setState(() {
      _isLoading = true;
      _items = [];
    });

    await Future.delayed(const Duration(seconds: 1));

    setState(() {
      _isLoading = false;

      final int count = int.tryParse(_countTextController.text) ?? 0;

      for (int i = 0; i < count; i++) {
        _items.add(_inputTextController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '입력 출력',
          style: TextStyle(color: Colors.black),
        ),
        actions: [
          IconButton(
            onPressed: () {
            },
            icon: const Icon(Icons.add_box),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _inputTextController,
                      decoration: InputDecoration(
                        hintText: '아버지',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: TextField(
                      controller: _countTextController,
                      decoration: InputDecoration(
                        hintText: '3',
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0),
                          borderSide: const BorderSide(
                            width: 2,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      printInput();
                    },
                    icon: const Icon(Icons.list_alt),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              _isLoading
              ? BottomLoadingContainer()
              : BottomListContainer(_inputTextController.text, int.parse(_countTextController.text)),
            ],
          ),
        ),
      ),
    );
  }
}

class BottomLoadingContainer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: Center(child: CircularProgressIndicator()),
      ),
    );
  }
}

class BottomListContainer extends StatelessWidget {
  final String text;
  final int count;

  const BottomListContainer(this.text, this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(border: Border.all(color: Colors.black)),
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return Text('${index + 1} $text');
          },
        ),
      ),
    );
  }
}
