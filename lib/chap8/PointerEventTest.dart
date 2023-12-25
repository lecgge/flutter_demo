import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PointerEventTest extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PointerEventTest();

}

class _PointerEventTest extends State<PointerEventTest> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试点击事件"),
        ),
        body: PointerMoveIndicatorState()
    );
  }
}

class PointerMoveIndicatorState extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _PointerMoveIndicatorState();

}

class _PointerMoveIndicatorState extends State<PointerMoveIndicatorState> {
  PointerEvent? _event;
  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Container(
        alignment: Alignment.center,
        color: Colors.blue,
        width: 300.0,
        height: 150.0,
        child: Text(
          '${_event?.localPosition ?? ''}',
          style: TextStyle(color: Colors.white),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
    );
  }

}

class PointerDownListener extends SingleChildRenderObjectWidget {
  final PointerDownEventListener? onPointerDown;

  PointerDownListener({Key? key,this.onPointerDown,Widget? child})
    :super(key:key,child:child);

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderPointerListener()..onPointerDown = onPointerDown;
  }

}