import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IceCreamView extends StatefulWidget {
  const IceCreamView({super.key});

  @override
  State<IceCreamView> createState() => _IceCreamViewState();
}

class _IceCreamViewState extends State<IceCreamView> {
  Map<String, dynamic>? decodeIcecream;

  @override
  void initState() {
    super.initState();
    loadIcecream();
  }

  Future<void> loadIcecream() async {
    final rawIcecream = await rootBundle.loadString("assets/icecreams.json");
    final decodeIcecreams = jsonDecode(rawIcecream);
    await Future.delayed(const Duration(seconds: 1));
    log(decodeIcecreams.toString());
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Icecream',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'We have something yummy for you',
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          if (decodeIcecream != null)
            const Text('Icecreams Loaded')
          else
            const Center(child: CircularProgressIndicator.adaptive()),
        ],
      ),
    );
  }
}
