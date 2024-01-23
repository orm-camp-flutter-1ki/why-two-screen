class PostDto {
  PostDto({
    this.title,
    this.imageUrl,
  });

  PostDto.fromJson(dynamic json) {
    title = json['title'];
    imageUrl = json['imageUrl'];
  }

  String? title;
  String? imageUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['title'] = title;
    map['imageUrl'] = imageUrl;
    return map;
  }
}
