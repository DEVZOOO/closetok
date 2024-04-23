import 'dart:async';

import 'package:closetok/src/constants/utils.dart';
import 'package:closetok/src/features/authentification/models/signup_model.dart';
import 'package:closetok/src/features/onboarding/interests_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SignupViewModel extends AsyncNotifier<void> {
  final Map<String, String> _form = {};
  bool isLoading = false;

  @override
  FutureOr<void> build() {}

  Map<String, String> get form => _form;

  void setUsername(String username) {
    _form['username'] = username;
  }

  void setEmail(String email) {
    _form['email'] = email;
  }

  void setPassword(String pw) {
    _form['password'] = pw;
  }

  void setBirthday(String birth) {
    _form['birthday'] = birth;
  }

  /// 회원가입 진행
  Future<void> signup(BuildContext context) async {
    state = const AsyncValue.loading();

    SignupModel signupModel = SignupModel.fromJson(_form);
    if (kDebugMode) {
      print('signup Model : ${signupModel.toString()}');
    }

    state = await AsyncValue.guard(() async {
      // TODO
      await Future.delayed(const Duration(seconds: 3));
    });

    if (state.hasError) {
      showSnackbar(context, state.error.toString());
    } else {
      // 문제없으면 interests 선택화면으로 이동
      context.goNamed(InterestsScreen.routeName);
    }
  }
}

final signupProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
