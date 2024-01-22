import 'dart:typed_data';

class Post {
  final String? uid;
  final String title;
  final Uint8List image;

//<editor-fold desc="Data Methods">
  const Post({
    this.uid,
    required this.title,
    required this.image,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          title == other.title &&
          image == other.image);

  @override
  int get hashCode => uid.hashCode ^ title.hashCode ^ image.hashCode;

  @override
  String toString() {
    return 'Post{' +
        ' uid: $uid,' +
        ' title: $title,' +
        ' image: $image,' +
        '}';
  }

  Post copyWith({
    String? uid,
    String? title,
    Uint8List? image,
  }) {
    return Post(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'title': this.title,
      'image': this.image,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      uid: map['uid'] as String,
      title: map['title'] as String,
      image: map['image'] as Uint8List,
    );
  }

//</editor-fold>
}
