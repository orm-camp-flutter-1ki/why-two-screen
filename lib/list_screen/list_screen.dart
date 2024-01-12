import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {

  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  TextEditingController _textController = TextEditingController();
  List<int> countList = [];


  List<int> count() {
    countList = List.generate(100, (index) => index + 1);
    return countList;
  }
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListScreen'),
      ),
      body: Align(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    count();
                  });
                },
                child: const Text('출력')),
            Expanded(
              child: ListView.builder(
                itemCount: countList.length,
                itemBuilder: (BuildContext context, int count) {
                  return Text('숫자출력 : $count  입니다. ');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
