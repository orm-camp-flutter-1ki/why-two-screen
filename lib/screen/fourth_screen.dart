import 'package:flutter/material.dart';

class FourthScreen extends StatefulWidget {
  const FourthScreen({super.key});

  @override
  State<FourthScreen> createState() => _FourthScreenState();
}

class _FourthScreenState extends State<FourthScreen> {
  final TextEditingController _nameEditingController = TextEditingController();
  final TextEditingController _countEditingController = TextEditingController();
  List<String> _image = []; // 이미지 리스트
  bool _isloading = false;

  @override
  void dispose() {
    _nameEditingController.dispose();
    _countEditingController.dispose();
    super.dispose();
  }

  Future<void> imageLoading() async {
    setState(() {
      _isloading = true;
      _image = [];
    });

    await Future.delayed(const Duration(seconds: 10));

    setState(() {
      _isloading = false;
    });
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
                    onPressed: () async {
                      await imageLoading();
                      setState(() {
                        int count = int.tryParse(_countEditingController.text) ?? 0;
                        for (int i = 0; i < count; i++) {
                          _image.add(_nameEditingController.text); // 지정된 수 만큼 출력
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
                itemCount: _image.length,
                itemBuilder: (BuildContext context, index) {
                  return Image.network(_image[index]);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

