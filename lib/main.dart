import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sky_scrapper/screens/pages/home_page.dart';
import 'package:sky_scrapper/screens/pages/search_page.dart';
import 'package:sky_scrapper/screens/pages/splash.dart';

import 'provider/weather_location_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => WeatherLocationProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      initialRoute: "splash",
      routes: {
        '/': (context) => const HomePage(),
        'splash': (context) => const Splash(),
        'search': (context) => const SearchPage(),
      },
    );
  }
}
