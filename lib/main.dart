import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_xproject/travel/travel_page.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TravelPage(),
      theme: ThemeData(
        accentColor: Colors.purple,
        primaryColor: Colors.orange,
        fontFamily: GoogleFonts.lato().fontFamily,
      ),
    );
  }
}
