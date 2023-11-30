import 'package:flutter/material.dart';

class TestInput extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Input();
  }
}

class Input extends State<TestInput> {
  final _unameController = TextEditingController();

  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("输入框及表单")),
      body: Column(
        children: [
          TextField(
            controller: _unameController,
            focusNode: focusNode1,
            onChanged: (value) {},
            decoration: const InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                prefixIcon: Icon(Icons.person)),
          ),
          TextField(
            focusNode: focusNode2,
            decoration: const InputDecoration(
                labelText: "密码",
                hintText: "您的登录密码",
                prefixIcon: Icon(Icons.lock),
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
            obscureText: true,
          ),
          Builder(builder: (ctx) {
            return Column(
              children: [
                ElevatedButton(
                    onPressed: () {
                      FocusScope.of(context).requestFocus(focusNode2);
                    },
                    child: const Text("移动焦点")),
                ElevatedButton(
                    onPressed: () {
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    },
                    child: const Text("隐藏键盘")),
              ],
            );
          })
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _unameController.addListener(() {
      print(_unameController.text);
    });
  }
}
