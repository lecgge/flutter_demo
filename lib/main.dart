import 'package:flutter/material.dart';

import 'Input.dart';
import 'ScaffoldTest.dart';
import 'ScrollerWidget/Scroller.dart';
import 'chap8/PointerEventTest.dart';
import 'chap9/TestAnimation.dart';
import 'color/ColorTest.dart';
import 'color/ThemeTestRoute.dart';
import 'container/Container.dart';
import 'functionWidget/MyInheritedWidget.dart';
import 'functionWidget/TestFunctionWidget.dart';
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
      routes: {
        "MyHomePage": (context) => const MyHomePage(title: "",),
        "new_page": (context) => const NewRoute(),
        "/": (context) => TestInput(),
        "Constraints": (context) => const Constraints(),
        "Container": (context) => Containers(),
        "ScaffoldTest": (context) => ScaffoldTest(),
        "Scroller": (context) => Scroller(),
        "TestFunctionWidge": (context) => TestFunctionWidge(),
        "InheritedWidgetTestRoute": (context) => InheritedWidgetTestRoute(),
        "ThemeTestRoute": (context) => ThemeTestRoute(),
        "PointerEventTest": (context) => PointerEventTest(),
        "TestAnimation": (context) => TestAnimation(),
      },
      initialRoute: "TestAnimation",
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
      child: Column(
        children: [
          NavBar(color: Colors.blue,title: "标题",),
          NavBar(color: Colors.white,title: "标题",),
        ],
      ),
    );
  }
}
