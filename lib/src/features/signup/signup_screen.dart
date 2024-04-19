import 'dart:io';

import 'package:closetok/generated/l10n.dart';
import 'package:closetok/src/constants/gaps.dart';
import 'package:closetok/src/constants/sizes.dart';
import 'package:closetok/src/features/signup/username_screen.dart';
import 'package:closetok/src/features/signup/widgets/icon_box.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

/// 회원가입 화면
class SignupScreen extends StatefulWidget {
  static const String routeUrl = "/signup";
  static const String routeName = "signupScreen";

  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  // google Ads 관련
  bool _isLoadAd = false;
  BannerAd? _bannerAd;

  @override
  void initState() {
    super.initState();
    // _loadAd(); // TODO - 앱스토어 업로드시 광고 가능
  }

  /// google Ads 로드
  void _loadAd() {
    final adUnitId = Platform.isAndroid
        ? dotenv.get("GOOGLE_ADS_ANDROID_UNIT_ID")
        : dotenv.get("GOOGLE_ADS_IOS_UNIT_ID");
    final bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: adUnitId,
      listener: BannerAdListener(
        onAdLoaded: (ad) {
          if (!mounted) {
            ad.dispose();
            return;
          }

          setState(() {
            _isLoadAd = true;
            _bannerAd = ad as BannerAd;
          });
        },
        onAdFailedToLoad: (ad, error) {
          if (kDebugMode) {
            print('BannerAd failed to load: $error');
          }
          ad.dispose();
        },
      ),
      request: const AdRequest(),
    );

    bannerAd.load();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final TEXT = S.of(context);
    final theme = Theme.of(context);

    return Localizations.override(
      context: context,
      // locale: const Locale("ko", "KR"),
      child: Scaffold(
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
                      Text(
                        TEXT.signupTitle,
                        style: theme.textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      Gaps.v20,
                      Text(
                        TEXT.signupDesc,
                        textAlign: TextAlign.center,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Gaps.v40,
                      // 회원가입 방식
                      IconBox(
                        text: TEXT.signupWithEmail,
                        icon: FontAwesomeIcons.user,
                        onTap: () {
                          if (kDebugMode) {
                            print('Tab Email');
                          }
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UsernameScreen(),
                            ),
                          );
                        },
                      ),
                      Gaps.v10,
                      IconBox(
                        text: TEXT.signupWithGoogle,
                        icon: FontAwesomeIcons.google,
                        onTap: () {
                          if (kDebugMode) {
                            print('Tap google');
                          }
                        },
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text("By Countinuing, you agree to our Teams"),
                    Gaps.v20,
                    Container(
                      padding: const EdgeInsets.only(
                        top: Sizes.size20,
                        bottom: Sizes.size40,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        border: Border(
                          top: BorderSide(
                            color: Colors.grey.shade200,
                            width: .5,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text("Already have an account?"),
                          Gaps.h5,
                          GestureDetector(
                            onTap: () {},
                            child: Text(
                              "Log In",
                              style: TextStyle(
                                color: theme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:
            _isLoadAd ? AdWidget(ad: _bannerAd!) : const SizedBox(),
      ),
    );
  }
}
