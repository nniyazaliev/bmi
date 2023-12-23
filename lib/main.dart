import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:bmi/screens/home_screen.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI App',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff1d2136),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xff1D2136),
          primary: const Color(0xFF9BA9EC),
          brightness: Brightness.dark,
        ),
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.poppins(
            fontSize: 20,
          ),
          bodyMedium: GoogleFonts.poppins(
            fontSize: 18,
          ),
          displaySmall: GoogleFonts.poppins(),
        ),
        useMaterial3: true,
      ),
      home: HomeScreen(),
    );
  }
}
