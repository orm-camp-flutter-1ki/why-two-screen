class Post {
  final String uid;
  final String title;
  final String imageUrl;

  const Post({
    required this.uid,
    required this.title,
    required this.imageUrl,
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
}
