import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/authentification/widgets/submit_button.dart';
import 'package:closetok/src/features/onboarding/tutorial_screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// interests 선택 화면
class InterestsScreen extends StatefulWidget {
  static const String routeUrl = "/interests";
  static const String routeName = "interestsScreen";

  const InterestsScreen({super.key});

  @override
  State<InterestsScreen> createState() => _InterestsScreenState();
}

class _InterestsScreenState extends State<InterestsScreen> {
  final List<String> interestsList = [
    'Daily Life',
    'Comedy',
    'Entertainment',
    'Animals',
    'Food',
    'Beauty & Style',
    'Drama',
    'Learning',
    'Talent',
    'Sports',
    'Auto',
    'Family',
    'Fitness & Health',
    'DIY & Life Hacks',
    'Arts & Crafts',
    'Dance',
    'Outdoors',
    'Oddly Satisfying',
    'Home & Garden',
  ];

  final ScrollController _controller = ScrollController();

  bool _showTitle = false;

  @override
  void initState() {
    super.initState();

    _controller.addListener(_onScroll);
  }

  /// 스크롤 이벤트
  void _onScroll() {
    if (_controller.offset > 30) {
      if (_showTitle) {
        return;
      }
      _showTitle = true;
    } else {
      _showTitle = false;
    }
    setState(() {});
  }

  /// 다음 클릭
  void _onNextTap() {
    context.goNamed(TutorialScreen.routeName);
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const TutorialScreen(),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: AnimatedOpacity(
          opacity: _showTitle ? 1 : 0,
          duration: const Duration(milliseconds: 300),
          child: const Text(
            'Choose your interests',
            style: TextStyle(
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        centerTitle: true,
        scrolledUnderElevation: 1,
        shadowColor: theme.dividerColor,
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: Sizes.size32,
          right: Sizes.size32,
          bottom: Sizes.size32,
        ),
        child: Scrollbar(
          controller: _controller,
          child: SingleChildScrollView(
            controller: _controller,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Choose your interests',
                  style: theme.textTheme.displayMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Gaps.v20,
                Center(
                  child: Text(
                    'Get better video recommendations',
                    style: theme.textTheme.titleLarge?.copyWith(
                      color: theme.secondaryHeaderColor,
                    ),
                  ),
                ),
                Gaps.v40,
                Wrap(
                  spacing: Sizes.size12,
                  runSpacing: Sizes.size20,
                  children: [
                    for (var i in interestsList)
                      Container(
                        padding: const EdgeInsets.symmetric(
                          vertical: Sizes.size14,
                          horizontal: Sizes.size16,
                        ),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(Sizes.size52),
                          border: Border.all(
                            color: theme.disabledColor,
                          ),
                        ),
                        child: Text(
                          i,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: theme.dividerColor,
              width: 1,
            ),
          ),
        ),
        child: BottomAppBar(
          height: Sizes.size96,
          padding: const EdgeInsets.only(
            left: Sizes.size32,
            right: Sizes.size32,
            top: Sizes.size12,
            bottom: Sizes.size32,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: (MediaQuery.of(context).size.width - 64 - 10) / 2,
                child: SubmitButton(
                  text: "Skip",
                  onTap: null,
                  color: theme.textTheme.bodyLarge?.color,
                  bgColor: theme.colorScheme.background,
                  borderColor: theme.dividerColor,
                ),
              ),
              SizedBox(
                width: (MediaQuery.of(context).size.width - 64 - 10) / 2,
                child: SubmitButton(
                  text: "Next",
                  onTap: _onNextTap,
                  bgColor: theme.primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
