import 'dart:math';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';
import 'package:why_two_screen/ui/detail/detail_view_model.dart';
import 'package:why_two_screen/ui/detail/list_screen.dart';

class DetailScreen extends StatefulWidget {
  final Color color;

  const DetailScreen(this.color, {super.key});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {


  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<DetailViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          '다음 화면',
          style: TextStyle(color: widget.color),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ListScreen(),
                ),
              );
            },
            icon: const Icon(Icons.next_plan_outlined),
          ),
        ],
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              setState(() {
                viewModel.bottomColor = getRandomColor();
              });
            },
            child: const Text('함수 호출'),
          ),
          BottomContainer(viewModel.bottomColor),
          ElevatedButton(
            onPressed: () {
              // 앞 화면으로 전달
              Navigator.pop(context, viewModel.bottomColor);
            },
            child: const Text('돌려주기'),
          ),
        ],
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
