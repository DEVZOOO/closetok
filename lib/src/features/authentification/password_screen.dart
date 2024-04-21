import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/authentification/birthday_screen.dart';
import 'package:closetok/src/features/authentification/view_models/signup_view_model.dart';
import 'package:closetok/src/features/authentification/widgets/input_text.dart';
import 'package:closetok/src/features/authentification/widgets/signup_container.dart';
import 'package:closetok/src/features/authentification/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 3. 비밀번호 입력
class PasswordScreen extends ConsumerStatefulWidget {
  const PasswordScreen({super.key});

  @override
  ConsumerState<PasswordScreen> createState() => _PasswordScreenState();
}

class _PasswordScreenState extends ConsumerState<PasswordScreen> {
  final TextEditingController _controller = TextEditingController();
  String _password = "";
  bool _isShow = false;
  bool _isValidLen = false, _isValidCh = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(() {
      _password = _controller.text;
      _validate();
      setState(() {});
    });
  }

  /// toggle show/hide
  void _toggleEye() {
    setState(() {
      _isShow = !_isShow;
    });
  }

  /// clear
  void _onXmarkTap() {
    _controller.clear();
  }

  /// 비밀번호 validate
  void _validate() {
    final lenReg = RegExp(r"^.{8,20}$");
    final chReg = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[,.!@#$%^&_])[a-zA-Z0-9,.!@#$%^&_]+$");

    _isValidLen = _password != "" && lenReg.hasMatch(_password);
    _isValidCh = chReg.hasMatch(_password);
  }

  /// 다음 버튼
  void _onNextTap() {
    ref.read(signupProvider.notifier).setPassword(_password);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const BirthdayScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SignupContainer(
      title: "비밀번호를 입력하세요.",
      children: [
        InputText(
          controller: _controller,
          isHide: !_isShow,
          suffixWidget: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: _toggleEye,
                iconSize: Sizes.size20,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size8,
                  vertical: Sizes.size6,
                ),
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: FaIcon(
                  _isShow ? FontAwesomeIcons.eyeSlash : FontAwesomeIcons.eye,
                  color: theme.primaryColor,
                ),
              ),
              IconButton(
                onPressed: _onXmarkTap,
                iconSize: Sizes.size20,
                padding: const EdgeInsets.symmetric(
                  horizontal: Sizes.size8,
                  vertical: Sizes.size6,
                ),
                constraints: const BoxConstraints(),
                style: const ButtonStyle(
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                icon: FaIcon(
                  FontAwesomeIcons.solidCircleXmark,
                  color: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
        Gaps.v20,
        const Text("Your password must have:"),
        Gaps.v10,
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.circleCheck,
              color: _isValidLen ? Colors.green : theme.disabledColor,
              size: Sizes.size20,
            ),
            Gaps.h4,
            const Text("8자리 이상 20자리 이하"),
          ],
        ),
        Gaps.v5,
        Row(
          children: [
            FaIcon(
              FontAwesomeIcons.circleCheck,
              color: _isValidCh ? Colors.green : theme.disabledColor,
              size: Sizes.size20,
            ),
            Gaps.h4,
            const Text("영문, 숫자, 특수문자(,.!@#\$%^&_) 포함"),
          ],
        ),
        Gaps.v40,
        SubmitButton(
          text: "다음",
          onTap: _onNextTap,
          bgColor: _isValidLen && _isValidCh
              ? theme.primaryColor
              : theme.disabledColor,
        ),
      ],
    );
  }
}
