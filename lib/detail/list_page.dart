import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<int> getNumberList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리스트페이지'),
        actions: [
          ElevatedButton(
              onPressed: () {
                setState(() {
                  getNumberList = getList();
                });
              },
              child: Text('출력'))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
          child: ListView.builder(
              itemCount: getNumberList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${getNumberList[index]}'),
                );
              }),
          // child: ListView.builder(
          //   itemCount: 20,
          //   itemBuilder: (context, index) {
          //     return Text('data');
          //   },
          // ),
        ),
      ),
    );
  }
}

List<int> getList() {
  List<int> myList = List.generate(100, (index) => index+1);
  return myList;
}
