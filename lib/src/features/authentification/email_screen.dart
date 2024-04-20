import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/features/authentification/password_screen.dart';
import 'package:closetok/src/features/authentification/widgets/input_text.dart';
import 'package:closetok/src/features/authentification/widgets/signup_container.dart';
import 'package:closetok/src/features/authentification/widgets/submit_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 2. 이메일 입력
class EmailScreen extends StatefulWidget {
  final String username;
  const EmailScreen({
    super.key,
    required this.username,
  });

  @override
  State<EmailScreen> createState() => _EmailScreenState();
}

class _EmailScreenState extends State<EmailScreen> {
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

    return SignupContainer(
      title: "${widget.username}, 이메일을 입력하세요.",
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
