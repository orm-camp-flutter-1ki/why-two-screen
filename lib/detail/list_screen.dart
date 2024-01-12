import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  List int = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13];
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
                      const int = 100;
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
              child: Container(
                //listview로 해보자
                child: ListView.builder(
                  itemCount: int.length,
                  itemBuilder: (context, index) {
                    return Text('${int[index]}');
                  },
                ),
                width: double.infinity,
                height: 100, //100인데 expanded해서 공간을 다 차지했나?
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
