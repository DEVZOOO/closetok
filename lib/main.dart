import 'dart:async';

import 'package:closetok/generated/l10n.dart';
import 'package:closetok/src/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  // google ads
  unawaited(MobileAds.instance.initialize());

  runApp(const Closetok());
}

class Closetok extends StatelessWidget {
  const Closetok({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "CloseTok",
      routerConfig: router,
      theme: ThemeData(
        primaryColor: const Color(0xffF26B8F),
        disabledColor: Colors.grey.shade400,
        hintColor: Colors.grey.shade600,
        dividerColor: Colors.grey.shade200,
        // textTheme: GoogleFonts.loraTextTheme(),,
      ),
      darkTheme: ThemeData(
        primaryColor: const Color(0xffF26B8F),
        disabledColor: Colors.grey.shade400,
        hintColor: Colors.grey.shade600,
        dividerColor: Colors.grey.shade200,
        // textTheme: GoogleFonts.loraTextTheme(),
      ),
      themeMode: ThemeMode.system,
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale("en"),
        Locale("ko"),
      ],
    );
  }
}
