import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'TestAnimatedSwitcher.dart';
import 'TestHero.dart';
import 'TestManyAnimations.dart';

class TestAnimation extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TestAnimation();
}

class _TestAnimation extends State<TestAnimation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("测试动画"),
      ),
      body: AnimatedSwitcherCounterRoute(),
    );
  }
}

class ScaleAnimationRoute extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ScaleAnimationRouteState();
}

class _ScaleAnimationRouteState extends State<ScaleAnimationRoute>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    //匀速
    //图片宽高从0变300
    // animation = Tween(begin: 0.0,end: 300.0).animate(controller)
    //   ..addListener(() {
    //     setState(() {
    //
    //     });
    //   });
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    animation.addStatusListener((status) {
      if(status == AnimationStatus.completed) {
        controller.reverse();
      } else if(status == AnimationStatus.dismissed) {
        controller.forward();
      }
    });
    //启动动画(正向执行)
    controller.forward();
  }

  // @override
  // Widget build(BuildContext context) {
  //   return Column(
  //     children: [
  //       AnimatedBuilder(
  //           animation: animation,
  //           child: Image.asset("assets/t.png"),
  //           builder: (BuildContext ctx, child) {
  //             return Center(
  //               child: SizedBox(
  //                 height: animation.value,
  //                 width: animation.value,
  //                 child: child,
  //               ),
  //             );
  //           }),
  //       IconButton(
  //           onPressed: () => {controller.reverse()},
  //           icon: const Icon(Icons.restart_alt))
  //     ],
  //   );
  // }

  @override
  void dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GrowTransition(animation: animation,
      child: Image.asset("assets/t.png"),
    );
  }
}

class AnimatedImage extends AnimatedWidget {
  const AnimatedImage({Key? key, required Animation<double> animation})
      : super(key: key, listenable: animation);

  @override
  Widget build(BuildContext context) {
    final animation = listenable as Animation<double>;
    return Center(
      child: Image.asset(
        "assets/t.png",
        width: animation.value,
        height: animation.value,
      ),
    );
  }
}

class ScaleAnimationRoute1 extends StatefulWidget {
  const ScaleAnimationRoute1({Key? key}) : super(key: key);

  @override
  _ScaleAnimationRouteState createState() => _ScaleAnimationRouteState();
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({Key? key, required this.animation, this.child})
      : super(key: key);

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (BuildContext context,child){
          return SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          );
        },
        child: child,
      ),
    );
  }
}
