import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final int _printCount = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list_alt),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            BottomListContainer(_printCount),
          ],
        ),
      ),
    );
  }
}


class BottomListContainer extends StatelessWidget {
  final int count;

  const BottomListContainer(this.count, {super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
        ),
        child: ListView.builder(
          itemCount: count,
          itemBuilder: (context, index) {
            return Text('${index + 1}');
          },
        ),
      ),
    );
  }
}