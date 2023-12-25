import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AnimatedSwitcherCounterRoute extends StatefulWidget {
  const AnimatedSwitcherCounterRoute({Key? key}) : super(key: key);

  @override
  _AnimatedSwitcherCounterRouteState createState() =>
      _AnimatedSwitcherCounterRouteState();
}

class _AnimatedSwitcherCounterRouteState
    extends State<AnimatedSwitcherCounterRoute> {
  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation) {
              return ScaleTransition(scale: animation, child: child,);
            },
            child: Text('$_count',key: ValueKey(_count),style: Theme.of(context).textTheme.headlineMedium,),
          ),
          ElevatedButton(onPressed: (){
            setState(() {
              _count++;
            });
          }, child: Text('+1'))
        ],
      ),
    );
  }
}