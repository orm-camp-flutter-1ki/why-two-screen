import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<int> numberList = [];

  List<int> generateList() {
    for (int i = 1; i <= 100; i++) {
      numberList.add(i);
    }
    return numberList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            '리스트 화면',
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  generateList();
                  // print(numberList);
                });


              },
              child: const Text('출력'),
            ),
          ]),
      body: Container(
        margin: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
        ),
        child: ListView.builder(
            itemCount: numberList.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                title: Text('${numberList[index]}'),
              );
            }),
      ),

    );
  }
}
