import 'dart:typed_data';

class Post {
  final String? uid;
  final String title;
  final String? imageUrl;

//<editor-fold desc="Data Methods">
  const Post({
    this.uid,
    required this.title,
    this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Post &&
          runtimeType == other.runtimeType &&
          uid == other.uid &&
          title == other.title &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => uid.hashCode ^ title.hashCode ^ imageUrl.hashCode;

  @override
  String toString() {
    return 'Post{' +
        ' uid: $uid,' +
        ' title: $title,' +
        ' imageUrl: $imageUrl,' +
        '}';
  }

  Post copyWith({
    String? uid,
    String? title,
    String? imageUrl,
  }) {
    return Post(
      uid: uid ?? this.uid,
      title: title ?? this.title,
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'uid': this.uid,
      'title': this.title,
      'imageUrl': this.imageUrl,
    };
  }

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      uid: map['uid'] as String,
      title: map['title'] as String,
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}
