import 'package:flutter/material.dart';

class ListNumber extends StatelessWidget {
  final int number;

  const ListNumber({
    super.key,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Text('$number');
  }
}
