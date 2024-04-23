import 'dart:async';

import 'package:closetok/generated/l10n.dart';
import 'package:closetok/src/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  // google AdMob
  unawaited(MobileAds.instance.initialize());

  runApp(
    const ProviderScope(
      child: Closetok(),
    ),
  );
}

class Closetok extends StatelessWidget {
  const Closetok({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "CloseTok",
      routerConfig: router,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xffF26B8F),
        disabledColor: Colors.grey.shade300,
        secondaryHeaderColor: Colors.grey.shade600,
        hintColor: Colors.grey.shade400,
        dividerColor: Colors.grey.shade200,
        textTheme: Typography.blackCupertino,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.white,
          color: Colors.white,
        ),
        colorScheme: const ColorScheme.light(),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: const Color(0xffF26B8F),
        disabledColor: Colors.grey.shade700,
        secondaryHeaderColor: Colors.grey.shade400,
        hintColor: Colors.grey.shade600,
        dividerColor: Colors.grey.shade800,
        textTheme: Typography.whiteCupertino,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.black12,
          surfaceTintColor: Colors.black12,
        ),
        bottomAppBarTheme: const BottomAppBarTheme(
          surfaceTintColor: Colors.black12,
          color: Colors.black12,
        ),
        colorScheme: const ColorScheme.dark(),
        useMaterial3: true,
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
