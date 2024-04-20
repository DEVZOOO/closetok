import 'package:closetok/src/features/authentification/login_screen.dart';
import 'package:closetok/src/features/authentification/signup_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: SignupScreen.routeUrl,
  routes: [
    ShellRoute(
      builder: (context, GoRouterState state, child) {
        if (kDebugMode) {
          // print('name : ${state.name}, uri : ${state.uri}, fullPath : ${state.fullPath}');
        }

        return child;
      },
      routes: [
        // 회원가입
        GoRoute(
          path: SignupScreen.routeUrl,
          name: SignupScreen.routeName,
          builder: (context, state) => const SignupScreen(),
        ),
        // 로그인
        GoRoute(
          path: LoginScreen.routeUrl,
          name: LoginScreen.routeName,
          builder: (context, state) => const LoginScreen(),
        ),
      ],
    ),
  ],
);
