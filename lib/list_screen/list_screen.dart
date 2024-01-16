import 'package:flutter/material.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final TextEditingController _imageUrlController = TextEditingController();
  final TextEditingController _numController = TextEditingController();
  bool _isLoading = false;

  //Image? image;
  List<Image> imageList = [];

  Future<void> imageAdd() async {
    setState(() {
      _isLoading = true;
    });

    await Future.delayed(const Duration(seconds: 3));

    setState(() {
      final imageUrl = _imageUrlController.text;
      _isLoading = false;
      final intValue = int.tryParse(_numController.text) ?? 0;

      final image = Image.network(imageUrl);
      for (int i = 0; i < intValue; i++) {
        imageList.add(image);
      }
    });
  }

  @override
  void dispose() {
    _imageUrlController.dispose();
    _numController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListScreen'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _imageUrlController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: TextField(
                    controller: _numController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      imageAdd();
                    },
                    child: const Text('출력')),
              ],
            ),
          ),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView.builder(
                    itemCount: imageList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return imageList[index];
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
