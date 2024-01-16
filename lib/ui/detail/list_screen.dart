import 'package:flutter/material.dart';
import 'package:why_two_screen/ui/detail/image_item_widget.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String inputText = '';
  final textController = TextEditingController();
  int inputNumber = 0;

  bool isLoading = false;

  List<String> allInputText = [];

  Future<void> searchUrl() async {
    // 로딩중입니다. 뜨기
    setState(() {
      isLoading = true;
    });

    // 3초 기다리기
    await Future.delayed(const Duration(seconds: 3));
    inputText = textController.text;
    // 일반 변수에 await 사용 불가
    // await allInputText.(textController.text);

    // 로딩중입니다. 없애기
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: textController,
                      // onChanged: (value) {
                      //   inputText = value;
                      // },
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
                    onPressed: () async {
                      // setState(() {
                      //   inputText = textController.text;
                      // });
                      await searchUrl();
                    },
                    child: const Text(
                      '출력',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              isLoading
                  ? const Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            '로딩중입니다.',
                            style: TextStyle(fontSize: 50),
                          ),
                        ],
                      ),
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: inputNumber,
                        itemBuilder: (context, index) {
                          final imageItem =
                              ImageItemWidget(imageUrl: textController.text);

                          // return Text(inputText);
                          return imageItem;
                        },
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
