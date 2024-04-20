import 'package:closetok/generated/l10n.dart';
import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/features/authentification/widgets/auth_box_button.dart';
import 'package:closetok/src/features/authentification/widgets/auth_container.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 로그인 화면
class LoginScreen extends StatelessWidget {
  static const String routeUrl = "/login";
  static const String routeName = "loginScreen";
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TEXT = S.of(context);
    final theme = Theme.of(context);
    return AuthContainer(
      title: "Log in",
      subtitle: "Manage your Account ..",
      authWidgetList: [
        AuthBoxButton(
          text: TEXT.signupWithEmail,
          icon: FontAwesomeIcons.user,
          onTap: () {
            if (kDebugMode) {
              print('Tap Email');
            }
          },
        ),
        Gaps.v10,
        AuthBoxButton(
          text: TEXT.signupWithGoogle,
          icon: FontAwesomeIcons.google,
          onTap: () {
            if (kDebugMode) {
              print('Tap google');
            }
          },
        ),
      ],
      bottomText: "By countinuing, you agree to our Terms of Service ..",
      bottomWidget: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text("Don't have an account?"),
          Gaps.h5,
          GestureDetector(
            onTap: () {},
            child: Text(
              "가입하기",
              style: TextStyle(
                color: theme.primaryColor,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
        ],
      ),
      bottomNavBarWidget: null,
    );
  }
}
