import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';

/// 회원가입 wrap
class SignupContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final Widget? titleIconWidget;
  final List<Widget> children;
  final Widget? bottomChild;

  const SignupContainer({
    super.key,
    required this.title,
    this.subtitle,
    this.titleIconWidget,
    required this.children,
    this.bottomChild,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "회원가입",
          style: theme.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Gaps.v40,

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          title,
                          style: theme.textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        if (subtitle != null) ...[
                          Gaps.v10,
                          Text(
                            subtitle!,
                            style: TextStyle(
                              color: theme.secondaryHeaderColor,
                            ),
                          ),
                        ],
                      ],
                    ),
                    if (titleIconWidget != null) titleIconWidget!,
                  ],
                ),

                Gaps.v20,

                ...children,
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: bottomChild,
    );
  }
}
