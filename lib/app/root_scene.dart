import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:movie_recommend/public.dart';

import 'package:movie_recommend/home/home_scene.dart';
import 'package:movie_recommend/my/my_scene.dart';

class RootScene extends StatefulWidget {
  final Widget child;

  RootScene({Key key, this.child}) : super(key: key);

  _RootSceneState createState() => _RootSceneState();
}

class _RootSceneState extends State<RootScene> {
  int _tabIndex = 0;
  bool isLoaded = false;


  // 定义 tab icon
List<Image> _tabImages = [
    Image.asset('images/tab_home.png'),
    Image.asset('images/tab_my.png'),
  ];
  List<Image> _tabSelectedImages = [
    Image.asset('images/tab_home_selected.png'),
    Image.asset('images/tab_my_selected.png'),
  ];

  @override
  void initState() { 
    super.initState();
    
    eventBus.on(EventUserLogin, (arg) {
      setState(() {});
    });

    eventBus.on(EventUserLogout, (arg) {
      setState(() {});
    });

    eventBus.on(EventToggleTabBarIndex, (arg) {
      setState(() {
        _tabIndex = arg;
      });
    });
    
  }

  @override
  void dispose() {
    eventBus.off(EventUserLogin);
    eventBus.off(EventUserLogout);
    eventBus.off(EventToggleTabBarIndex);
    super.dispose();
  }

  
  
  
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      body: IndexedStack(
        children: <Widget>[
          HomeScene(),
          MyScene()
        ],
        index: _tabIndex,
      ),
      bottomNavigationBar: CupertinoTabBar(
        backgroundColor: Colors.white,
        activeColor: AppColor.primary,
        border: Border(top: BorderSide.none),
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: getTabIcon(0),
            title: Text('首页'),
          ),
          BottomNavigationBarItem(
            icon: getTabIcon(1),
            title: Text("我的"),
          )
        ],
        currentIndex: _tabIndex,
        onTap: (index) {
          setState(() {
            _tabIndex = index;
          });
        },
      ),
    );
  }
  Image getTabIcon(int index) {
  if (index == _tabIndex) {
      return _tabSelectedImages[index];
    } else {
      return _tabImages[index];
    }
  }
}

