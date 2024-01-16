import 'package:flutter/material.dart';
import 'fourth_screen.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({super.key});

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _countEditingController = TextEditingController();
  List<String> nameCounts = [];

  @override
  void dispose() {
    _nameEditingController.dispose();
    _countEditingController.dispose();
    super.dispose();
  }

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
                      controller: _nameEditingController,
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
                      controller: _countEditingController,
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      setState(() {
                        int count = int.tryParse(_countEditingController.text) ?? 0;
                        nameCounts = List.generate(count, (index) => _nameEditingController.text);
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
