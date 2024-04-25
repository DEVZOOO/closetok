import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class Tutorial1Screen extends StatelessWidget {
  const Tutorial1Screen({super.key});

  @override
  Widget build(BuildContext context) {
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
                "https://cdn.pixabay.com/photo/2023/09/02/18/26/ai-generated-8229399_1280.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          Gaps.v60,

          Gaps.v48,
        ],
      ),
    );
  }
}
