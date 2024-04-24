import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/main_navigation/widgets/nav_menu.dart';
import 'package:closetok/src/features/main_navigation/widgets/post_button.dart';
import 'package:closetok/src/features/videos/videos_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class MainNavigationScreen extends StatelessWidget {
  final String tab;

  final List<String> _tabList = [
    "video",
    "discover",
    "record",
    "inbox",
    "profile",
  ];

  late final int _tabIndex = _tabList.indexOf(tab);

  MainNavigationScreen({
    super.key,
    required this.tab,
  });

  @override
  Widget build(BuildContext context) {
    if (kDebugMode) {
      print(tab);
    }

    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          Offstage(
            offstage: _tabIndex != 0,
            child: const VideosScreen(),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: theme.dividerColor,
            ),
          ),
        ),
        child: BottomAppBar(
          padding: const EdgeInsets.symmetric(
            horizontal: Sizes.size12,
          ),
          height: 62,
          child: Row(
            children: [
              NavMenu(
                text: "Home",
                icon: FontAwesomeIcons.house,
                isFocus: _tabIndex == 0,
                onTap: () => context.go("/video"),
              ),
              Gaps.h12,
              NavMenu(
                text: "Discover",
                icon: FontAwesomeIcons.magnifyingGlass,
                isFocus: _tabIndex == 1,
                onTap: () => context.go("/discover"),
              ),
              Gaps.h24,
              const PostButton(),
              Gaps.h24,
              NavMenu(
                text: "Inbox",
                icon: FontAwesomeIcons.message,
                isFocus: _tabIndex == 3,
                onTap: () {},
              ),
              Gaps.h12,
              NavMenu(
                text: "Profile",
                icon: FontAwesomeIcons.user,
                isFocus: _tabIndex == 4,
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
