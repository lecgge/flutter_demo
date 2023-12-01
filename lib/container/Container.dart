import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Containers extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _Containers();
}

class _Containers extends State<Containers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("容器组件"),
      ),
      body: TestPadding(),
    );
  }
}

class TestPadding extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: const [
          Padding(
              padding: EdgeInsets.only(left: 8), child: Text("Hello world")),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text("I am Jack"),
          ),
          Padding(
            // 分别指定四个方向的补白
            padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
            child: Text("Your friend"),
          )
        ],
      ),
    );
  }
}
