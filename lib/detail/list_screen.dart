import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  String valueString = '';
  int count = 0;
  final valueTextEditingController = TextEditingController();
  final countTextEditingController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    valueTextEditingController.dispose();
    countTextEditingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('출력화면'),
      ),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 40,
                width: 100,
                child: TextFormField(
                  controller: valueTextEditingController,
                  decoration: const InputDecoration(hintText: '값 입력'),
                ),
              ),
              Container(
                height: 40,
                width: 100,
                child: TextFormField(
                  controller: countTextEditingController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                  decoration: const InputDecoration(
                    hintText: '갯수 입력',
                  ),
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    setState(() {
                      isLoading = true;
                    });

                    await Future.delayed(const Duration(seconds: 3));
                    // valueString.clear();
                    setState(() {
                      isLoading = false;
                      valueString = (valueTextEditingController.text);
                      count =
                          int.tryParse(countTextEditingController.text) ?? 0;
                    });
                  },
                  child: const Text('출력')),
            ],
          ),
          isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : Expanded(
                  child: Container(
                    child: ListView.builder(
                      itemCount: count,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.network(valueString, fit: BoxFit.cover,),
                        );

                      },
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}
