import 'package:flutter/material.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({super.key});

  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    _numberController.dispose();
    super.dispose();
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
                  _textController.text;
                });
                // print(_textController.text);
                // print(int.parse(_numberController.text));
              },
              child: const Text('출력'))
        ]),
        Expanded(
          child: Container(
            margin: const EdgeInsets.all(16),
            width: double.infinity,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black),
            ),
            child: ListView.builder(
                itemCount: int.tryParse(_numberController.text),
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(title: Text('${_textController.text}'));
                }),
          ),
        ),
      ]),
    );
  }
}
