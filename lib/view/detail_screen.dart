import 'dart:math';
import 'package:flutter/material.dart';
import 'final_screen.dart';
import 'image_print_screen.dart';
import 'list_screen.dart';
import 'print_screen.dart';

class DetailScreen extends StatefulWidget {
  final Color color;

  const DetailScreen(this.color, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  Color _bottomColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'detail',
          style: TextStyle(color: widget.color),
        ),
        actions:  [
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ListScreen()));
          }, child: const Text('list')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => PrintScreen()));
          }, child: const Text('print')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => ImagePrintScreen()));
          }, child: const Text('image')),
          ElevatedButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) => FinalScreen()));
          }, child: const Text('final')),
        ]
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bottomColor = getRandomColor();
                });
              },
              child: const Text('함수 호출'),
            ),
            BottomContainer(_bottomColor),
            ElevatedButton(
              onPressed: () {
                // 앞 화면으로 전달
                Navigator.pop(context, _bottomColor);
              },
              child: const Text('돌려주기'),
            ),
          ],
        ),
      ),
    );
  }

  Color getRandomColor() {
    final random = Random();
    final red = random.nextInt(256);
    final green = random.nextInt(256);
    final blue = random.nextInt(256);

    final newColor = Color.fromARGB(255, red, green, blue);
    return newColor;
  }
}

class BottomContainer extends StatelessWidget {
  final Color color;

  const BottomContainer(this.color, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: color,
      width: 300,
      height: 300,
    );
  }
}