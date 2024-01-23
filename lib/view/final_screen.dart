import 'package:flutter/material.dart';
import 'package:why_two_screen/data/pixabay_api.dart';
import '../model/photo.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final pixabayApi = PixabayApi();
  final _textController = TextEditingController();
  List<Photo> _items = [];
  bool _isLoading = false;

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> loadIcon() async {
    setState(() {
      _isLoading = true;
    });

    // 미래에 3초 후에 끝날 동작
    await Future.delayed(const Duration(seconds: 3));
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '출력 화면',
        ),
      ),
      body: Column(children: [
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            width: 100,
            height: 50,
            child: TextField(
              controller: _textController,
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.purple.shade100,
              ),
            ),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
              onPressed: () async {
                final items = await pixabayApi.getData(_textController.text);
                setState(() {
                  _items = items;
                  loadIcon();
                });
              },
              child: const Text('출력'))
        ]),
        _isLoading
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListView(
                    children: _items
                        .map(
                          (e) => ListTile(
                            leading: Container(
                              width: 50,
                                height: 50,
                                decoration: BoxDecoration (
                                  image: DecorationImage (
                                    fit: BoxFit.cover,
                                    image: NetworkImage('${e.previewURL}'),
                                ),
                                ),
                                ),
                            title: Text('${e.tags}'),
                          ),
                        )
                        .toList(),
                  ),
                ),
              ),
      ]),
    );
  }
}
