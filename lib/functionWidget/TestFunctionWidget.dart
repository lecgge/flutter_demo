import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TestFunctionWidge extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestFunctionWidge();
}

class _TestFunctionWidge extends State<TestFunctionWidge> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试功能型组件"),
      ),
      body: WillPopScopeTestRoute(),
    );
  }
}

class WillPopScopeTestRoute extends StatelessWidget {
  DateTime? _lastPressedAt; //上次点击时间
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Container(
          alignment: Alignment.center,
          child: Text("1秒内连续按两次返回键退出"),
        ),
        onWillPop: () async {
          if (_lastPressedAt == null ||
              DateTime.now().difference(_lastPressedAt!) >
                  const Duration(seconds: 1)) {
            _lastPressedAt = DateTime.now();
            return false;
          }
          return true;
        });
  }
}
