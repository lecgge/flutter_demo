import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HeroAnimationRouteA extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: Column(
        children: [
          InkWell(
            child: Hero(
              tag: "avatar",
              child: ClipOval(
                child: Image.asset(
                  "assets/t.png",
                  width: 50.0,
                ),
              ),
            ),
            onTap: () {
              Navigator.push(context, PageRouteBuilder(pageBuilder: (
                BuildContext context,
                animation,
                secondaryAnimation,
              ) {
                return FadeTransition(
                  opacity: animation,
                  child: Scaffold(
                    appBar: AppBar(
                      title: const Text("原图"),
                    ),
                    body: HeroAnimationRouteB(),
                  ),
                );
              }));
            },
          ),
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text("点击头像"),
          )
        ],
      ),
    );
  }
}

class HeroAnimationRouteB extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Hero(tag: "avatar", child: Image.asset("assets/t.png")),
    );
  }

}
