import 'package:closetok/src/features/authentification/login_screen.dart';
import 'package:closetok/src/features/authentification/signup_screen.dart';
import 'package:closetok/src/features/main_navigation/main_navigation_screen.dart';
import 'package:closetok/src/features/onboarding/interests_screen.dart';
import 'package:closetok/src/features/onboarding/tutorial_screen.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  // initialLocation: SignupScreen.routeUrl,
  initialLocation: TutorialScreen.routeUrl,
  routes: [
    ShellRoute(
      builder: (context, GoRouterState state, child) {
        // if (kDebugMode) {
        //   print(
        //       'name : ${state.name}, uri : ${state.uri}, fullPath : ${state.fullPath}'); // /interests
        // }

        // return [SignupScreen.routeUrl, LoginScreen.routeUrl, "/"]
        //         .contains(state.fullPath)
        //     ? child
        //     : Scaffold(
        //         body: child,
        //       );
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
        // interests
        GoRoute(
          path: InterestsScreen.routeUrl,
          name: InterestsScreen.routeName,
          builder: (context, state) => const InterestsScreen(),
        ),
        // tutorial
        GoRoute(
          path: TutorialScreen.routeUrl,
          name: TutorialScreen.routeName,
          builder: (context, state) => const TutorialScreen(),
        ),

        GoRoute(
          path: "/:tab(video|discover|inbox|profile)",
          builder: (context, state) {
            final tab = state.pathParameters['tab']!;
            return MainNavigationScreen(tab: tab);
          },
        ),
      ],
    ),
  ],
);
