import 'package:flutter/material.dart';

class MyScene extends StatefulWidget {
  final Widget child;

  MyScene({Key key, this.child}) : super(key: key);

  _MySceneState createState() => _MySceneState();
}

class _MySceneState extends State<MyScene> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}