import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';

/// 인증화면 wrapper
class AuthContainer extends StatelessWidget {
  /// 제목
  final String title;

  /// 서브제목(회색)
  final String subtitle;

  /// 인증(회원가입/로그인)버튼 위젯리스트
  final List<Widget> authWidgetList;

  /// 하단 텍스트(회색)
  final String bottomText;

  /// 하단 회색 박스 안 위젯
  final Widget bottomWidget;

  /// botton nav bar(Google Admod)
  final Widget? bottomNavBarWidget;

  const AuthContainer({
    super.key,
    required this.title,
    required this.subtitle,
    required this.authWidgetList,
    required this.bottomText,
    required this.bottomWidget,
    this.bottomNavBarWidget,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity, // width 꽉차게
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: Sizes.size40),
                child: Column(
                  children: [
                    Gaps.v60,
                    // Title
                    Text(
                      title,
                      style: theme.textTheme.headlineSmall?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Gaps.v20,

                    // Sub title
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: theme.hintColor,
                      ),
                    ),
                    Gaps.v40,
                    ...authWidgetList,
                  ],
                ),
              ),
              Column(
                children: [
                  Text(bottomText),
                  Gaps.v20,
                  Container(
                    padding: const EdgeInsets.only(
                      top: Sizes.size20,
                      bottom: Sizes.size40,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      border: Border(
                        top: BorderSide(
                          color: Colors.grey.shade100,
                          width: .5,
                        ),
                      ),
                    ),
                    child: bottomWidget,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: bottomNavBarWidget,
    );
  }
}
