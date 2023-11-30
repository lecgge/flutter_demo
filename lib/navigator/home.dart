import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

class HomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return Home();
  }
}

class Home extends State<HomeWidget> {
  @override
  Widget build(BuildContext context) {
    return HomePage();
  }
}

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePage();
  }
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final wordPair = WordPair.random();
    String icons = "";
    // accessible: 0xe03e
    icons += "\uE03e";
    // error:  0xe237
    icons += " \uE237";
    // fingerprint: 0xe287
    icons += " \uE287";
    return Scaffold(
      appBar: AppBar(
        title: const Text("wordPair"),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              icons,
              style: const TextStyle(
                fontFamily: "MaterialIcons",
                fontSize: 24.0,
                color: Colors.green,
              ),
            ),
            const DecoratedBox(
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/ac.png"),
              )),
            ),
            OutlinedButton(
              onPressed: () {
                Navigator.pushNamed(context, "new_page", arguments: "hi");
              },
              child: const Text("跳转新页面"),
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.thumb_up)),
            ElevatedButton.icon(
                onPressed: () {}, icon: Icon(Icons.send), label: Text("发送")),
            Image.asset(
              "assets/ac.png",
              width: 100.0,
            ),
            Image.network(
              "https://book.flutterchina.club/assets/img/3-11.a063365a.png",
              width: 100.0,
            ),
            SwitchAndCheckBoxTestRoute()
          ],
        ),
      ),
    );
  }
}

class NewRoute extends StatelessWidget {
  const NewRoute({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments;
    print(args.toString());
    Paint paint = Paint()..color = Colors.yellow;
    return Scaffold(
      appBar: AppBar(
        title: const Text("New route"),
      ),
      body: Text(
        "Hello world",
        style: TextStyle(
            color: Colors.blue,
            fontSize: 18.0,
            height: 1.2,
            fontFamily: "Courier",
            background: Paint()..color = Colors.yellow,
            decoration: TextDecoration.underline,
            decorationStyle: TextDecorationStyle.dashed),
      ),
    );
  }
}

class SwitchAndCheckBoxTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SwitchAndCheckBoxTestRoute();
  }
}

class _SwitchAndCheckBoxTestRoute extends State<SwitchAndCheckBoxTestRoute> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
            value: _switchSelected,
            onChanged: (value) {
              setState(() {
                _switchSelected = value;
              });
            }),
        Checkbox(
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value!;
              });
            }),
      ],
    );
  }
}
