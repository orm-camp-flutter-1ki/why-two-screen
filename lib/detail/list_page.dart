import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('리스트페이지'),
        actions: [ElevatedButton(onPressed: () {}, child: Text('출력'))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black),
          ),
        ),
      ),
    );
  }
}
