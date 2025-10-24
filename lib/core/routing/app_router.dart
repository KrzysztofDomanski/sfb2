import 'package:go_router/go_router.dart';
import 'package:sfb/features/home/home_screen.dart';

class AppRouter {
  final router = GoRouter(
    routes: [
      GoRoute(
        name: HomeScreen.route,
        path: HomeScreen.route,
        builder: (context, state) => const HomeScreen(),
      ),
    ],
  );
}
