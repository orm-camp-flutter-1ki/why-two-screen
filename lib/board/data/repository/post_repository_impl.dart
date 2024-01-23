import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:why_two_screen/board/domain/model/post.dart';
import 'package:why_two_screen/board/domain/repository/post_repository.dart';

class PostRepositoryImpl implements PostRepository {
  final _postsRef = FirebaseFirestore.instance.collection('posts');
  final _storageRef = FirebaseStorage.instance.ref('posts');

  @override
  Future<void> addPost(String title, Uint8List image) async {
    // 이미지 업로드
    final uploadRef =
        _storageRef.child('${DateTime.now().microsecondsSinceEpoch}.jpg');
    await uploadRef.putData(
      image,
      SettableMetadata(
        contentType: "image/jpeg",
      ),
    );
    final downloadUrl = await uploadRef.getDownloadURL();

    // DB 업로드
    await _postsRef.add({
      'title': title,
      'imageUrl': downloadUrl,
    });
  }

  @override
  Future<List<Post>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }
}
