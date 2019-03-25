import 'package:flutter/material.dart';

class DiscoveryScene extends StatefulWidget {
  final Widget child;

  DiscoveryScene({Key key, this.child}) : super(key: key);

  _DiscoverySceneState createState() => _DiscoverySceneState();
}

class _DiscoverySceneState extends State<DiscoveryScene> {
  @override
  Widget build(BuildContext context) {
    return Container(
       child: widget.child,
    );
  }
}