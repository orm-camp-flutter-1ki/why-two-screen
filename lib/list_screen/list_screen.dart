import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _textController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  String stringValue = '';
  int intValue = 0;
  List<int> countList = [];
  List<String> stringList = [];

  List<int> count() {
    countList = List.generate(100, (index) => index + 1);
    return countList;
  }

  void combineAdd(String stringValue, int intValue) {
    for (int i = 0; i < intValue; i++) {
      stringList.add(stringValue);
    }
  }

  @override
  void dispose() {
    _textController.dispose();
    _numController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListScreen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _textController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _numController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        stringValue = _textController.text;
                        intValue = int.tryParse(_numController.text) ?? 0;
                        combineAdd(stringValue, intValue);

                      });
                    },
                    child: const Text('출력')),
              ],
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Expanded(
                  child: ListView.builder(
                    itemCount: stringList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return Text(stringList[index]);
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
