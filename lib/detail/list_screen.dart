import 'package:flutter/material.dart';
import 'package:why_two_screen/widget/list_number.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  // List<ListNumber> numberWidgets = [];

  String inputText = '';
  int inputNumber = 0;

  // void printNumber() {
  //   // numberWidgets =
  //   //     List.generate(100, (index) => ListNumber(number: index + 1));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        // setState(() {
                          inputText = value;
                          // print('text = $inputText');
                        // });
                      },
                      decoration: InputDecoration(
                        hintText: 'text',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: TextField(
                      onChanged: (value) {
                        inputNumber = int.tryParse(value) ?? 0;
                        // print('text = $inputNumber');
                      },
                      decoration: InputDecoration(
                        hintText: 'number',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      setState(() {
                        //   // printNumber();
                      });
                    },
                    child: const Text(
                      '출력',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Expanded(
                // child: ListView(
                //   children: numberWidgets,
                // ),
                child: ListView.builder(
                    itemCount: inputNumber,
                    itemBuilder: (context, index) {
                      return Text(inputText);
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
