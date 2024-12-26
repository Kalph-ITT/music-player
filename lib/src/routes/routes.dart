// GoRouter configuration
import 'package:go_router/go_router.dart';
import 'package:music_player/src/routes/route_constants.dart';
import 'package:music_player/src/ui/screens/home/home_screen.dart';
import 'package:music_player/src/ui/screens/player/player_screen.dart';

class AppRouter {
  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: RouteConstants.home,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: '/player',
        name: RouteConstants.player,
        builder: (context, state) => PlayerScreen(),
      )
    ],
  );
}
