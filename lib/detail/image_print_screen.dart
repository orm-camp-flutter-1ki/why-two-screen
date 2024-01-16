import 'package:flutter/material.dart';

class ImagePrintScreen extends StatefulWidget {
  const ImagePrintScreen({super.key});

  @override
  State<ImagePrintScreen> createState() => _ImagePrintScreenState();
}

class _ImagePrintScreenState extends State<ImagePrintScreen> {
  final _textController = TextEditingController();
  final _numberController = TextEditingController();
  bool _isLoading = false;
  List<String> _items = [];



  Future<void>printImage() async{
    setState(() {
      _isLoading = true;
      _items = [];
    });

    await Future.delayed(Duration(seconds: 1));
    setState(() {
    _isLoading = false;

    final int count = int.tryParse(_numberController.text) ?? 0;

    for(int i = 0; i < count; i++) {
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
                  printImage();
                  // print(_items);
                });
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
                              title: Image.network(e),
                            ))
                        .toList(),
                  ),
                ),
              ),
      ]),
    );
  }
}
