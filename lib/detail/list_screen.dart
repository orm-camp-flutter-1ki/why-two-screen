import 'package:flutter/material.dart';
import 'package:why_two_screen/widget/list_number.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<ListNumber> numberWidgets = [];

  void printNumber() {
    numberWidgets = List.generate(100, (index) => ListNumber(number: index + 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      printNumber();
                    });
                  },
                  child: const Text(
                    '출력',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: numberWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
