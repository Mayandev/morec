import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:movie_recommend/public.dart';

import 'home_list_view.dart';


class HomeScene extends StatefulWidget {
  final Widget child;

  HomeScene({Key key, this.child}) : super(key: key);

  _HomeSceneState createState() => _HomeSceneState();
}



class _HomeSceneState extends State<HomeScene> {
  @override
  void initState() { 
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
         appBar: AppBar(
           brightness: Brightness.light,
           title: Text('首页'),
           backgroundColor: AppColor.white,
          //  app bar 阴影
           elevation: 0,
           actions: <Widget>[
             IconButton(
               icon: Icon(Icons.search),
               onPressed:() => showSearch(context:context, delegate: SearchBarDelegate()),
             ),
           ],
         ),
         body: HomeListView()
       );
  }
}

