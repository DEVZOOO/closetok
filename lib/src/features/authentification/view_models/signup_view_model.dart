import 'dart:async';

import 'package:closetok/src/features/authentification/models/signup_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
  Future<void> signup() async {
    state = const AsyncValue.loading();

    SignupModel signupModel = SignupModel.fromJson(_form);
    if (kDebugMode) {
      print('signup Model : ${signupModel.toString()}');
    }

    state = await AsyncValue.guard(() async {
      // TODO
      await Future.delayed(const Duration(seconds: 3));
    });
  }
}

final signupProvider = AsyncNotifierProvider<SignupViewModel, void>(
  () => SignupViewModel(),
);
