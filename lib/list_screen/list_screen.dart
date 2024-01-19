import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/fake_data.dart';
import 'package:why_two_screen/list_screen/list_view_model.dart';

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _nameController = TextEditingController();
  final _countController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _countController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<ListViewModel>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('아버지가 3명'),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: _nameController,
                ),
              ),
              Expanded(
                child: TextField(
                  controller: _countController,
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  viewModel.printFather();
                },
                child: const Text('출력'),
              ),
            ],
          ),
          viewModel.isLoading
              ? const Center(
                  child: Text('로딩'),
                )
              : Expanded(
                  child: ListView(
                    children: viewModel.photos
                        .map((e) => ListTile(
                              title: Text(e.title),
                              leading: Image.network(e.thumbnailUrl),
                            ))
                        .toList(),
                  ),
                ),
        ],
      ),
    );
  }
}


// 모델 클래스
// JsonSerializable
// Freezed
// json to dart
class Photo {
  final String thumbnailUrl;
  final String title;

//<editor-fold desc="Data Methods">
  const Photo({
    required this.thumbnailUrl,
    required this.title,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Photo &&
          runtimeType == other.runtimeType &&
          thumbnailUrl == other.thumbnailUrl &&
          title == other.title);

  @override
  int get hashCode => thumbnailUrl.hashCode ^ title.hashCode;

  @override
  String toString() {
    return 'Photo{' + ' thumbnailUrl: $thumbnailUrl,' + ' title: $title,' + '}';
  }

  Photo copyWith({
    String? thumbnailUrl,
    String? title,
  }) {
    return Photo(
      thumbnailUrl: thumbnailUrl ?? this.thumbnailUrl,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'thumbnailUrl': this.thumbnailUrl,
      'title': this.title,
    };
  }

  factory Photo.fromMap(Map<String, dynamic> map) {
    return Photo(
      thumbnailUrl: map['thumbnailUrl'] as String,
      title: map['title'] as String,
    );
  }

//</editor-fold>
}