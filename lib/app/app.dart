import 'package:flutter/material.dart';
import 'package:flutter_learn/app/home_view.dart';
import 'package:google_fonts/google_fonts.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Learn',
      theme: ThemeData(
        fontFamily: GoogleFonts.dmSans().fontFamily,
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeView(),
    );
  }
}
