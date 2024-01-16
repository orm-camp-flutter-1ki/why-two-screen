import 'package:flutter/material.dart';
import 'package:why_two_screen/screen/third_screen.dart';

class SecondScreen extends StatefulWidget {
  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  List<int> _numberList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ThirdScreen()));
            },
          )
        ],
        title: const Text(
          '두번째 화면',
        ),
      ),
      body: Column(
        children: [
          Align(
            alignment: Alignment.center,
            child: ElevatedButton(
                onPressed: () {
                  setState(
                    () {
                      _numberList = List.generate(100, (index) => index + 1);
                    },
                  );
                },
                child: const Text('숫자 출력')),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _numberList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Center(
                    child: Text(
                      '${_numberList[index]}',
                      style: const TextStyle(fontSize: 20),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
