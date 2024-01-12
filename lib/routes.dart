import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:why_two_screen/ui/main/main_screen.dart';
import 'package:why_two_screen/ui/main/main_view_model.dart';

final router = GoRouter(
  routes: [
    GoRoute(
        path: '/',
        builder: (context, state) => ChangeNotifierProvider(
              create: (_) => MainViewModel(),
              child: const MainScreen(),
            )),
  ],
);
