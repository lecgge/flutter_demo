import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Constraints extends StatelessWidget {
  const Constraints({super.key});

  @override
  Widget build(BuildContext context) {
    Widget redBox = DecoratedBox(decoration: BoxDecoration(color: Colors.red));
    return Scaffold(
      appBar: AppBar(
        title: const Text("约束布局"),
      ),
      body: Column(
        children: [
          ConstrainedBox(
            constraints: const BoxConstraints(minWidth: 50.0, minHeight: 50.0),
            child: SizedBox(
              height: 80,
              width: 80,
              child: redBox,
            ),
          )
        ],
      ),
    );
  }
}
