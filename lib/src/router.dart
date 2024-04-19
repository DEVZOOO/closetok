import 'package:closetok/src/features/signup/signup_screen.dart';
import 'package:closetok/src/features/signup/username_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SignupScreen.routeUrl,
  routes: [
    ShellRoute(
      builder: (context, state, child) {
        return child;
      },
      routes: [
        GoRoute(
          path: SignupScreen.routeUrl,
          builder: (context, state) => const SignupScreen(),
        ),
        GoRoute(
          path: "/username",
          builder: (context, state) => const UsernameScreen(),
        ),
      ],
    ),
  ],
);
