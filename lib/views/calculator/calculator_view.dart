import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CalculatorView extends StatefulWidget {
  const CalculatorView({super.key});

  @override
  State<CalculatorView> createState() => _CalculatorViewState();
}

class _CalculatorViewState extends State<CalculatorView> {
  late final AppLifecycleListener _appLifecycleListener;
  int x = 0;
  int y = 0;
  num z = 0;
  final displayone = TextEditingController();
  final displatTwo = TextEditingController();

  @override
  void initState() {
    super.initState();
    displayone.text = x.toString();
    displatTwo.text = y.toString();

    _appLifecycleListener = AppLifecycleListener(
      onResume: _onResume,
      onInactive: _onInactive,
      onShow: _onShow,
      onHide: _onHide,
      onDetach: _onDetach,
      onPause: _onPause,
      onRestart: _onRestart,
      onStateChange: _onStateChange,
    );
  }

  void _onResume() => log('onResume Called');
  void _onShow() => log('onShow Called');
  void _onInactive() => log('onInactive called');
  void _onHide() => log('onHide Called');
  void _onDetach() => log('onDetach Called');
  void _onPause() => log('onPause Called');
  void _onRestart() => log('onRestart Called');
  void _onStateChange(AppLifecycleState state) => log("onStateChanged called with state:$state");

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    displayone.dispose();
    displatTwo.dispose();
    _appLifecycleListener.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Column(
        children: [
          DisplayTextFiels(
            hint: 'Enter First Number',
            controller: displayone,
          ),
          const SizedBox(
            height: 25,
          ),
          DisplayTextFiels(
            hint: 'Enter Second Number',
            controller: displatTwo,
          ),
          const SizedBox(
            height: 45,
          ),
          Text(
            z.toString(),
            style: const TextStyle(
              fontSize: 40,
              color: Colors.white,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayone.text)! +
                        num.tryParse(displatTwo.text)!;
                  });
                },
                child: const Icon(
                  CupertinoIcons.add,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayone.text)! -
                        num.tryParse(displatTwo.text)!;
                  });
                },
                child: const Icon(
                  CupertinoIcons.minus,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayone.text)! *
                        num.tryParse(displatTwo.text)!;
                  });
                },
                child: const Icon(
                  CupertinoIcons.multiply,
                ),
              ),
              FloatingActionButton(
                onPressed: () {
                  setState(() {
                    z = num.tryParse(displayone.text)! /
                        num.tryParse(displatTwo.text)!;
                  });
                },
                child: const Icon(
                  CupertinoIcons.divide,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 25,
          ),
          FloatingActionButton.extended(
              onPressed: () {
                setState(() {
                  x = 0;
                  y = 0;
                  z = 0;
                  displayone.clear();
                  displatTwo.clear();
                });
              },
              label: const Text('Clear')),
        ],
      ),
    );
  }
}

class DisplayTextFiels extends StatelessWidget {
  final String? hint;
  final TextEditingController controller;
  const DisplayTextFiels({
    super.key,
    required this.hint,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
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
