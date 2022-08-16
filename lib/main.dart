import 'dart:io';

import 'package:candy_bars/features/authentication/ui/signIn/sign_in_view.dart';
import 'package:candy_bars/features/authentication/ui/splash/splash_view.dart';
import 'package:candy_bars/features/home/ui/home/home_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env");

  await Supabase.initialize(
    url: dotenv.env['SUPABASE_URL']!,
    anonKey: dotenv.env['SUPABASE_ANON_KEY']!,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      navigatorKey: navigatorKey,
      theme: ThemeData(
          //primarySwatch: Colors.deepOrange,
          fontFamily: GoogleFonts.permanentMarker().fontFamily,
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrangeAccent),
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
          ),
          appBarTheme: AppBarTheme(
              elevation: 0,
              color: Colors.transparent,
              titleTextStyle: TextStyle(
                fontFamily: GoogleFonts.permanentMarker().fontFamily,
                color: Colors.black,
                fontSize: 28,
              )),
          floatingActionButtonTheme: FloatingActionButtonThemeData(backgroundColor: Colors.deepOrange)),
      home: const SplashView(),
    );
  }
}
