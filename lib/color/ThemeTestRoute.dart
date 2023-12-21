import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ThemeTestRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ThemeTestRouteState();
}

class _ThemeTestRouteState extends State<ThemeTestRoute> {
  //当前路由主题色
  var _themeColor = Colors.teal;

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme(
        data: ThemeData(
            //用于导航栏、FloatingActionButton的背景色等
            primarySwatch: _themeColor,
            //用于Icon颜色
            iconTheme: IconThemeData(color: _themeColor)),
        child: Scaffold(
          appBar: AppBar(
            title: const Text("主题测试"),
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //第一行Icon使用主题中的iconTheme
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text(" 颜色跟随主题")
                ],
              ),
              //第二行Icon自定义颜色（固定为黑色）
              Theme(
                data: themeData.copyWith(
                    iconTheme:
                        themeData.iconTheme.copyWith(color: Colors.black)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.favorite),
                    Icon(Icons.airport_shuttle),
                    Text(" 颜色固定为黑色")
                  ],
                ),
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () =>{
              setState(()=>{
                _themeColor =
                    _themeColor == Colors.teal ? Colors.blue : Colors.teal
              }),
            },
            child: Icon(Icons.palette),
          ),
        )
    );
  }
}
