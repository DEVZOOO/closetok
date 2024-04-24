import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/authentification/widgets/submit_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class Tutorial2Screen extends StatelessWidget {
  const Tutorial2Screen({super.key});

  /// 다음버튼
  void _onNextTap(BuildContext context) {
    context.go("/video");
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Swipe up',
            style: TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.w700,
            ),
          ),
          Gaps.v20,
          const Text(
            'Videos are personalized for you based on what you watch, like, and share.',
            style: TextStyle(
              fontSize: Sizes.size20,
            ),
          ),

          Gaps.v60,
          // Image
          Expanded(
            child: SizedBox(
              width: double.infinity,
              child: Image.network(
                "https://cdn.pixabay.com/photo/2021/07/28/12/57/groot-6500180_1280.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Gaps.v60,

          SubmitButton(
            text: "Start watching",
            onTap: () => _onNextTap(context),
            bgColor: theme.primaryColor,
          ),
        ],
      ),
    );
  }
}
