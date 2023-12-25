import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDefineWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyDefineWidget();
}

class _MyDefineWidget extends State<MyDefineWidget> {
  @override
  Widget build(BuildContext context) {}
}

class GradientButton extends StatelessWidget {
  const GradientButton({
    Key? key,
    this.colors,
    this.width,
    this.height,
    this.onPressed,
    this.borderRadius,
    required this.child,
  }) : super(key: key);

  // 渐变色数组
  final List<Color>? colors;

  // 按钮宽高
  final double? width;
  final double? height;
  final BorderRadius? borderRadius;

  //点击回调
  final GestureTapCallback? onPressed;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    List<Color> _colors =
        colors ?? [theme.primaryColor, theme.primaryColorDark];
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: _colors),
        borderRadius: borderRadius,
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          splashColor: _colors.last,
          highlightColor: Colors.transparent,
          borderRadius: borderRadius,
          onTap: onPressed,
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(height: height, width: width),
            child: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DefaultTextStyle(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      child: child)),
            ),
          ),
        ),
      ),
    );
  }
}
