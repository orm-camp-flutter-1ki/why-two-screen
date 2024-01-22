import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:why_two_screen/board/domain/image_selector/image_selector.dart';

class ImageSelectorImpl implements ImageSelector {
  final ImagePicker _picker = ImagePicker();

  @override
  Future<Uint8List?> pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    return await image?.readAsBytes();
  }
}
