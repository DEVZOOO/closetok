import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/onboarding/tutorial1_screen.dart';
import 'package:closetok/src/features/onboarding/tutorial2_screen.dart';
import 'package:flutter/material.dart';

/// tutorial
class TutorialScreen extends StatefulWidget {
  static const String routeUrl = "/tutorial";
  static const String routeName = "tutorialScreen";
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  bool _showFirst = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onPanUpdate: (details) {
        final dx = details.delta.dx;
        // -면 다음, +면 이전
        if (dx < 0) {
          _showFirst = false;
        } else {
          _showFirst = true;
        }

        setState(() {});
      },
      child: Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.size32),
            child: AnimatedCrossFade(
              firstChild: const Tutorial1Screen(),
              secondChild: const Tutorial2Screen(),
              crossFadeState: _showFirst
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 300),
            ),
          ),
        ),
      ),
    );
  }
}
