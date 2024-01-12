import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  int numbers = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Screen'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    numbers = 100;
                  });
                },
                child: const Text('출력'),
              ),
            ],
          ),
          Expanded(
            child: SizedBox(
              child: ListView.builder(
                itemCount: numbers,
                itemBuilder: (BuildContext context, int index) {
                  return Text('${index + 1}');
                },
              ),
            ),
          )
        ],
      ),
    );
  }
}
