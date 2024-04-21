import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/features/authentification/password_screen.dart';
import 'package:closetok/src/features/authentification/view_models/signup_view_model.dart';
import 'package:closetok/src/features/authentification/widgets/input_text.dart';
import 'package:closetok/src/features/authentification/widgets/signup_container.dart';
import 'package:closetok/src/features/authentification/widgets/submit_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// 2. 이메일 입력
class EmailScreen extends ConsumerStatefulWidget {
  final String username;
  const EmailScreen({
    super.key,
    required this.username,
  });

  @override
  ConsumerState<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends ConsumerState<EmailScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _email = "";
  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    // init controller
    _textEditingController.addListener(() {
      setState(() {
        _email = _textEditingController.text;
        _isWriting = _email != "";
      });
    });
  }

  /// 버튼 클릭
  void _onTap() {
    if (kDebugMode) {
      print('email : $_email');
    }

    ref.read(signupProvider.notifier).setEmail(_email);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const PasswordScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final username = ref.read(signupProvider.notifier).form['username'];

    return SignupContainer(
      title: "$username, 이메일을 입력하세요.",
      children: [
        InputText(
          controller: _textEditingController,
          hintText: "이메일",
          keyboardType: TextInputType.emailAddress,
        ),
        Gaps.v40,
        SubmitButton(
          text: "다음",
          onTap: _isWriting ? _onTap : null,
          bgColor: _isWriting ? theme.primaryColor : theme.disabledColor,
        ),
      ],
    );
  }
}
