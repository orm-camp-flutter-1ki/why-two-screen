import 'package:flutter/material.dart';

class ImageItemWidget extends StatelessWidget {
  String imageUrl;

  ImageItemWidget({
    super.key,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(
        imageUrl,
        fit: BoxFit.cover,
      ),
    );
    // return Container(
    //   child: Image.network(
    //     imageUrl,
    //     fit: BoxFit.cover,
    //   ),
    // );
  }
}
