import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:why_two_screen/board/domain/model/post.dart';
import 'package:why_two_screen/board/domain/repository/post_repository.dart';

import '../dto/post_dto.dart';

class PostRepositoryImpl implements PostRepository {
  final _postsRef =
      FirebaseFirestore.instance.collection('posts').withConverter<PostDto>(
            fromFirestore: (snapshot, _) => PostDto.fromJson(snapshot.data()!),
            toFirestore: (post, _) => post.toJson(),
          );
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
    await _postsRef.add(PostDto.fromJson({
      'title': title,
      'imageUrl': downloadUrl,
    }));
  }

  @override
  Future<List<Post>> getPosts() {
    // TODO: implement getPosts
    throw UnimplementedError();
  }

  @override
  Stream<List<Post>> getPostsStream() {
    return _postsRef.snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final dto = doc.data();
        return Post(
          uid: doc.id,
          title: dto.title ?? '',
          imageUrl: dto.imageUrl ?? '',
        );
      }).toList();
    });
  }
}
