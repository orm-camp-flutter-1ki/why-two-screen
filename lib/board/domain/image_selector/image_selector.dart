import 'dart:typed_data';

abstract interface class ImageSelector {
  Future<Uint8List?> pickImage();
}
