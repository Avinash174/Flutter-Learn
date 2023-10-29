import 'package:flutter/material.dart';
import 'package:flutter_learn/icecream/icecream_view.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: IceCreamView(),
      ),
    );
  }
}
