
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ParentWidget extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => _ParentWidget();
}

class _ParentWidget extends State<ParentWidget>{
  bool _active = false;

  void _handleTapboxChanged(bool newValue){
    setState(() {
      _active = newValue;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(
      child:TapBoxB(
        active:_active,
        onChanged:_handleTapboxChanged,
      ),
    );
  }
}

class TapBoxB extends StatelessWidget{
  TapBoxB({Key? key,this.active =false,required this.onChanged})
    :super(key: key);

  final bool active;
  final ValueChanged<bool> onChanged;

  void _handleTap(){
    onChanged(!active);
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _handleTap,
      child: Container(
        child: Center(
            child: Text(
              active ? 'Active' : 'Inactive',
              style: const TextStyle(fontSize: 32.0, color: Colors.white),
            )),
      ),
    );
  }

}
