import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/authentification/view_models/signup_view_model.dart';
import 'package:closetok/src/features/authentification/widgets/input_text.dart';
import 'package:closetok/src/features/authentification/widgets/signup_container.dart';
import 'package:closetok/src/features/authentification/widgets/submit_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

/// 4. 생일 입력
class BirthdayScreen extends ConsumerStatefulWidget {
  const BirthdayScreen({super.key});

  @override
  ConsumerState<BirthdayScreen> createState() => _BirthdayScreenState();
}

class _BirthdayScreenState extends ConsumerState<BirthdayScreen> {
  final DateTime nowDate = DateTime.now();
  late final DateTime initTime =
      DateTime(nowDate.year - 12, nowDate.month, nowDate.day);
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.text = _getDateTimeFormat(initTime);
  }

  /// yyyy-MM-dd HH:mm:ss to yyyy-MM-dd
  String _getDateTimeFormat(DateTime date) => date.toString().split(" ").first;

  /// 다음 버튼
  void _onNextTap() async {
    ref.read(signupProvider.notifier).setBirthday(_controller.text);
    ref.read(signupProvider.notifier).signup(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SignupContainer(
      title: "When's your birthday?",
      subtitle: "Your birthday won't be shown public.",
      titleIconWidget: const FaIcon(
        FontAwesomeIcons.cakeCandles,
        size: Sizes.size40,
      ),
      bottomChild: BottomAppBar(
        height: 300,
        child: CupertinoDatePicker(
          mode: CupertinoDatePickerMode.date,
          initialDateTime: initTime,
          maximumDate: DateTime(nowDate.year - 12, nowDate.month, nowDate.day),
          onDateTimeChanged: (value) {
            _controller.text = _getDateTimeFormat(value);
          },
        ),
      ),
      children: [
        InputText(
          controller: _controller,
          isReadonly: true,
        ),
        Gaps.v40,
        SubmitButton(
          text: ref.watch(signupProvider).isLoading ? "Loading..." : "다음",
          onTap: ref.watch(signupProvider).isLoading ? null : _onNextTap,
          bgColor: ref.watch(signupProvider).isLoading
              ? theme.disabledColor
              : theme.primaryColor,
        ),
      ],
    );
  }
}
