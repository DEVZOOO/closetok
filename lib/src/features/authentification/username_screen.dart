import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/features/authentification/email_screen.dart';
import 'package:closetok/src/features/authentification/widgets/input_text.dart';
import 'package:closetok/src/features/authentification/widgets/signup_container.dart';
import 'package:closetok/src/features/authentification/widgets/submit_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

/// 1. 이름 입력
class UsernameScreen extends StatefulWidget {
  const UsernameScreen({super.key});

  @override
  State<UsernameScreen> createState() => _UsernameScreenState();
}

class _UsernameScreenState extends State<UsernameScreen> {
  final TextEditingController _textEditingController = TextEditingController();
  String _name = "";
  bool _isWriting = false;

  @override
  void initState() {
    super.initState();
    _textEditingController.addListener(() {
      if (kDebugMode) {
        // print('text : ${_textEditingController.text}');
      }
      setState(() {
        _name = _textEditingController.text;
        _isWriting = _name != "";
      });
    });
  }

  /// 가입하기 버튼
  void _onTap() {
    if (kDebugMode) {
      print('name : $_name');
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EmailScreen(
          username: _name,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SignupContainer(
      title: "이름을 생성하세요.",
      subtitle: "You can always change this later.",
      children: [
        InputText(
          controller: _textEditingController,
          hintText: "이름",
        ),
        Gaps.v40,
        SubmitButton(
          text: "가입하기",
          onTap: _isWriting ? _onTap : null,
          bgColor: _isWriting ? theme.primaryColor : theme.disabledColor,
        ),
      ],
    );
  }
}
