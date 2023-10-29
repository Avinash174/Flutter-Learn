import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_learn/icecream/model/icecream_data.dart';

class IceCreamView extends StatelessWidget {
  const IceCreamView({super.key});

  Future<List<Icecreams>> loadIcecream() async {
    final rawIcecream = await rootBundle.loadString("assets/icecreams.json");

    await Future.delayed(const Duration(seconds: 1));
    final icecreams = jsonDecode(rawIcecream);
    return icecreams;

    // log(decodeIcecream.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Icecreams',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'We have something yummy for you',
            style: Theme.of(context).textTheme.bodySmall!,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FutureBuilder(
                  future: loadIcecream(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      final icecreams = snapshot.data;
                      return const Center(
                        child: Text("Icecreams Loaded"),
                      );
                    } else {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
