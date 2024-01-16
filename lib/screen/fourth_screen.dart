import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController countEditingController = TextEditingController();
  List<String> nameCounts = [];
  List<String> imageUrl = [];

  @override
  void dispose() {
    nameEditingController.dispose();
    countEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('네번째 화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: nameEditingController,
                    ),
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.black, width: 1),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: countEditingController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int count = int.tryParse(countEditingController.text) ?? 0;
                        for (int i = 0; i < count; i++) {
                          imageUrl.add(nameEditingController.text); // 수정된 부분
                        }
                      });
                    },
                    child: const Text('출력')),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1,
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                ),
                itemCount: imageUrl.length,
                itemBuilder: (BuildContext context, index) {
                  return Image.network(imageUrl[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

