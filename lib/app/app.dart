import 'package:flutter/material.dart';
import 'package:flutter_learn/views/home_view.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Learn',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: HomeView(),
    );
  }
}
