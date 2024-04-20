import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';

/// 회원가입 wrap
class SignupContainer extends StatelessWidget {
  final String title;
  final String? subtitle;
  final List<Widget> children;

  const SignupContainer({
    super.key,
    required this.title,
    this.subtitle,
    required this.children,
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
                      color: theme.hintColor,
                    ),
                  ),
                ],

                Gaps.v20,

                ...children,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
