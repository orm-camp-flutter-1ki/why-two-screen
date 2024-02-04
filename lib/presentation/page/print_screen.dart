import 'package:flutter/material.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({super.key});

  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  final _textController = TextEditingController();
  final _numberController = TextEditingController();
  List<String> _items = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _textController.dispose();
    _numberController.dispose();
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

      final int count = int.tryParse(_numberController.text) ?? 0;

      for (int i = 0; i < count; i++) {
        _items.add(_textController.text);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '출력 화면',
        ),
      ),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 100,
            height: 50,
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.purple.shade100,
              ),
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 100,
            height: 50,
            child: TextField(
              controller: _numberController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.purple.shade100,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
              onPressed: () {
                setState(() {
                  printFather();
                });
                // print(_textController.text);
                // print(int.parse(_numberController.text));
              },
              child: const Text('출력'))
        ]),
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListView(
                    children: _items
                        .map((e) => ListTile(
                              title: Text(e),
                            ))
                        .toList(),
                  ),
                ),
              ),
      ]),
    );
  }
}
