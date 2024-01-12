import 'package:flutter/material.dart';

class PrintScreen extends StatefulWidget {
  const PrintScreen({super.key});

  @override
  State<PrintScreen> createState() => _PrintScreenState();
}

class _PrintScreenState extends State<PrintScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '출력 화면',
        ),
      ),
      body: Column(
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            SizedBox(
              width: 100,
              height: 50,
              child: TextField(
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
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.purple.shade100,
                ),
              ),
            ),
            const SizedBox(width: 8),
            ElevatedButton(onPressed: () {}, child: const Text('출력'))
          ]),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
