import 'package:flutter/material.dart';
import 'fourth_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  TextEditingController nameEditingController = TextEditingController();
  TextEditingController countEditingController = TextEditingController();
  List<String> nameCounts = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.navigate_next_outlined),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const FourthScreen()));
            },
          )
        ],
        title: const Text('세번째 화면'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.max,
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
                        nameCounts = List.generate(count, (index) => nameEditingController.text);
                        print(nameCounts);
                      });
                    },
                    child: const Text('출력')),
                const SizedBox(
                  height: 16,
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: nameCounts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(nameCounts[index]),
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
