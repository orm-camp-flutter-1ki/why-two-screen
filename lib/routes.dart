import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/ui/detail/detail_screen.dart';
import 'package:why_two_screen/ui/detail/detail_view_model.dart';
import 'package:why_two_screen/ui/main/main_screen.dart';
import 'package:why_two_screen/ui/main/main_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => ChangeNotifierProvider(
        create: (_) => MainViewModel(),
        child: const MainScreen(),
      ),
    ),
    GoRoute(
      path: '/detailScreen',
      builder: (context, state) {
        final color = state.extra as Color;

        return ChangeNotifierProvider(
          create: (_) => DetailViewModel(),
          child: DetailScreen(color),
        );
      },
    ),
  ],
);
