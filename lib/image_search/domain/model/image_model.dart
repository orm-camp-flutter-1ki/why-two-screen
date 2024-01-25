class ImageModel {
  final String imageUrl;

//<editor-fold desc="Data Methods">
  const ImageModel({
    required this.imageUrl,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ImageModel &&
          runtimeType == other.runtimeType &&
          imageUrl == other.imageUrl);

  @override
  int get hashCode => imageUrl.hashCode;

  @override
  String toString() {
    return 'ImageModel{' + ' imageUrl: $imageUrl,' + '}';
  }

  ImageModel copyWith({
    String? imageUrl,
  }) {
    return ImageModel(
      imageUrl: imageUrl ?? this.imageUrl,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'imageUrl': this.imageUrl,
    };
  }

  factory ImageModel.fromMap(Map<String, dynamic> map) {
    return ImageModel(
      imageUrl: map['imageUrl'] as String,
    );
  }

//</editor-fold>
}