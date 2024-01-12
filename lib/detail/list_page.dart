import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  const ListPage({super.key});

  @override
  State<ListPage> createState() => _ListPageState();
}

class _ListPageState extends State<ListPage> {
  List<dynamic> getNumberList = ['안녕', 0];

  final textEditingController1 = TextEditingController();
  final textEditingController2 = TextEditingController();

  List<dynamic> getQuery(String a, String b) {
    String word = a;
    int count = int.parse(b);
    List<dynamic> queryList = [word, count];
    return queryList;
  }

  @override
  void dispose() {
    textEditingController1.dispose();
    textEditingController2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text('리스트페이지'),
        actions: [
          SizedBox(
            width: 40,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController1,
                decoration: InputDecoration(
                  hintText: '글자',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: textEditingController2,
                decoration: InputDecoration(
                  hintText: '갯수',
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: const BorderSide(width: 1, color: Colors.black),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    getNumberList = getQuery(textEditingController1.text,
                        textEditingController2.text);
                  },
                );
              },
              child: Text('출력'),
            ),
          )
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
              itemCount: getNumberList[1],
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('${getNumberList[0]}'),
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

// List<int> getList() {
//   List<int> myList = List.generate(100, (index) => index + 1);
//   return myList;
// }
