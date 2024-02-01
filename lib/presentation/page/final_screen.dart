import 'package:flutter/material.dart';
import 'package:why_two_screen/presentation/view_model/final_screen_viewmodel.dart';
import 'package:provider/provider.dart';

class FinalScreen extends StatefulWidget {
  const FinalScreen({super.key});

  @override
  State<FinalScreen> createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  final _textController = TextEditingController();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<FinalScreenViewModel>();
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
                viewModel.loadIcon(_textController.text);
              },
              child: const Text('출력'))
        ]),
        viewModel.isLoading
            ? const Center(child: CircularProgressIndicator())
            : Expanded(
                child: Container(
                  margin: const EdgeInsets.all(16),
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black),
                  ),
                  child: ListView(
                    children: viewModel.items
                        .map(
                          (e) => ListTile(
                            leading: Container(
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
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
