import 'dart:core';

import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {//statefulwidget에서 가져오면 widget으로 시작
  ListScreen({super.key});//외부에서 생성자를 통해서 데이터를 받고 싶을때, 중괄호뒤에는 쉼표가 안된다


  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List<int> result = [];

  List<int> generate() {
    List<int> resultInt = List.generate(100, (index) => index + 1);
    return resultInt;
  }

  //List intList = [];
  //list.generate 100번 수행한다
  //for는 100번 만들어준다

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        result.addAll(generate());

                        print(result); //타입을 쓰면 새로 변수가 새로 만들어진다
                      });
                    },
                    child: Text(
                      '출력',
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                //그려졌는데 다시 추가되지는 않는다
                itemCount: result.length,
                itemBuilder: (context, index) {
                  return Container(
                    height: 15,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        '${result[index]}',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
