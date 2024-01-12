import 'package:flutter/material.dart';


class ListWidget extends StatelessWidget {

  List<int> getNumberList;

  ListWidget({
    super.key,
    required this.getNumberList,
  });

  @override
  Widget build(BuildContext context) {
    return Text('$getNumberList');
  }

}
