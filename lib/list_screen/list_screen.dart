import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ListScreen extends StatefulWidget {
  const ListScreen({super.key});

  @override
  State<ListScreen> createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {
  final _nameController = TextEditingController();
  final _countController = TextEditingController();
  List<String> _items = []; // List
  bool _isLoading = false; // 로딩

  var _jsonMapList = [];  // List<dynamic>

  // List<String> titles = [];
  // List<String> tumbnailUrls = [];

  List<Photo> _photos = [];

  @override
  void dispose() {
    _nameController.dispose();
    _countController.dispose();
    super.dispose();
  }

  Future<void> printFather() async {
    setState(() {
      // 로딩 3초 하고
      _isLoading = true;
      _items = [];
    });

    // 미래에 3초 후에 끝날 동작
    await Future.delayed(const Duration(seconds: 3));

    // 결과 보여주자
    _isLoading = false;

    final dio = Dio();
    final response =
        await dio.get('https://jsonplaceholder.typicode.com/photos');

    _jsonMapList = response.data;

    _photos = _jsonMapList.map((e) => Photo.fromMap(e)).toList();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
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
                  printFather();
                },
                child: const Text('출력'),
              ),
            ],
          ),
          _isLoading
              ? const Center(
                  child: Text('로딩'),
                )
              : Expanded(
                  child: ListView(
                    children: _photos
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