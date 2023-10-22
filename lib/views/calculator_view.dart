import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatelessWidget {
  const CalculatorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          const DisplayTextFiels(
            hint: 'Enter First Number',
          ),
          const SizedBox(
            height: 25,
          ),
          const DisplayTextFiels(
            hint: 'Enter Second Number',
          ),
          const SizedBox(
            height: 45,
          ),
          const Text(
            '0',
            style: TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.add,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.minus,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.multiply,
                ),
              ),
              FloatingActionButton(
                onPressed: () {},
                child: const Icon(
                  CupertinoIcons.divide,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class DisplayTextFiels extends StatelessWidget {
  final String? hint;
  const DisplayTextFiels({
    super.key,
    required this.hint,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      autofocus: true,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        border: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 3.0,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(10.0),
          ),
        ),
        hintText: hint,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
      ),
    );
  }
}
