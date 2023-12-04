import 'package:flutter/material.dart';
import 'package:flutter_demo/TapboxA.dart';

import 'Input.dart';
import 'ParentWidget.dart';
import 'ParentWidgetC.dart';
import 'ScaffoldTest.dart';
import 'TestState.dart';
import 'container/Container.dart';
import 'layout/contraints.dart';
import 'navigator/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        "new_page": (context) => const NewRoute(),
        "/": (context) => TestInput(),
        "Constraints": (context) => const Constraints(),
        "Container": (context) => Containers(),
        "ScaffoldTest": (context) => ScaffoldTest(),
      },
      initialRoute: "ScaffoldTest",
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blue,
      child: Row(
        children: [const Text("A")],
      ),
    );
  }
}
