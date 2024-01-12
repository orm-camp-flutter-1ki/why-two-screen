import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final outputTextEditingController = TextEditingController();
  final countTextEditingController = TextEditingController();

  String _printCount = '3';
  String _printText = '아버지';

  @override
  void dispose() {
    outputTextEditingController.dispose();
    countTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: outputTextEditingController,
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
                    controller: countTextEditingController,
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
                    setState(() {
                      _printText = outputTextEditingController.text ?? 'Test';
                      _printCount = countTextEditingController.text ?? '3';
                    });
                  },
                  icon: const Icon(Icons.list_alt),
                ),
              ],
            ),
            const SizedBox(height: 16),
            BottomListContainer(_printText, int.parse(_printCount)),
          ],
        ),
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
