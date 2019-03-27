import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';
import 'dart:async';

import 'package:movie_recommend/public.dart';

import 'movie_list_item.dart';
import 'movie_top_item.dart';

class MovieTopListView extends StatefulWidget {
  final String action;
  final String title;
  final String subTitle;

  const MovieTopListView({Key key, this.action, this.title, this.subTitle})
      : super(key: key);

  @override
  _MovieTopListViewState createState() => _MovieTopListViewState();
}

class _MovieTopListViewState extends State<MovieTopListView> with RouteAware {
  List<MovieItem> movieList;
  ScrollController scrollController = ScrollController();
  // 导航栏透明度
  double navAlpha = 0;

  // 默认加载 20 条数据
  int start = 0, count = 25;

  bool _loaded = false;
  bool isVisible = true;

  double coverWidth = Screen.width;
  double coverHeight = 218.0 + Screen.topSafeHeight;

  @override
  void initState() {
    super.initState();
    fetchData();

    // 监听页面滚动，显示导航栏
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent) {
          // print('滑动到了最底部');
          fetchData();
      }
      var offset = scrollController.offset;
      if (offset < 0) {
        if (navAlpha != 0) {
          setState(() {
            navAlpha = 0;
          });
        }
      } else if (offset < 50) {
        setState(() {
          navAlpha = 1 - (50 - offset) / 50;
        });
      } else if (navAlpha != 1) {
        setState(() {
          navAlpha = 1;
        });
      }
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context));
  }

  @override
  void didPush() {
    // 间隔500毫秒后，再设置状态栏样式。否则设置无效（会被build覆盖？）。
    Timer(Duration(milliseconds: 500), () {
      updateStatusBar();
    });
  }

  @override
  void didPopNext() {
    isVisible = true;
    updateStatusBar();
  }

  @override
  void didPop() {
    isVisible = false;
  }

  @override
  void didPushNext() {
    isVisible = false;
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    scrollController.dispose();
    super.dispose();
  }

  back() {
    Navigator.pop(context);
  }

  updateStatusBar() {
    if (navAlpha == 1) {
      Screen.updateStatusBarStyle(SystemUiOverlayStyle.dark);
    } else {
      Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);
    }
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Container(
          width: 44,
          height: Screen.navigationBarHeight,
          padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
          child: GestureDetector(
            onTap: back,
            child: Image.asset('images/icon_arrow_back_white.png'),
          ),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.white,
            ),
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            child: Row(
              children: <Widget>[
                Container(
                  width: 44,
                  child: GestureDetector(
                    onTap: back,
                    child: Image.asset('images/icon_arrow_back_black.png'),
                  ),
                ),
                Expanded(
                  child: Text(
                    this.widget.title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(width: 44),
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    if (isVisible) {
      updateStatusBar();
    }

    if (this.movieList == null) {
      return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: GestureDetector(
            onTap: back,
            child: Image.asset('images/icon_arrow_back_black.png'),
          ),
          ),
          body: Center(
            child: CupertinoActivityIndicator(
            ),
          ));
    }

    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: EdgeInsets.only(top: 0),
                  children: <Widget>[
                    _buildHeader(),
                    _buildList(),
                  ],
                ),
              )
            ],
          ),
          buildNavigationBar(),
        ],
      ),
    );
  }

  Widget _buildList() {
    // 排名
    int index = 1;
    List<Widget> children = [];
    for (var i = 0; i < movieList.length; i++) {
      children.add(MovieTopItem(index: index++, item: MovieListItem(movieList[i], this.widget.action),));
    }
    Widget loading = Container(
      padding: EdgeInsets.symmetric(vertical: 15),
      child: Offstage(
        offstage: _loaded,
        child: CupertinoActivityIndicator(),
      ),
    );
    children.add(loading);
    return Container(
      // padding: EdgeInsets.symmetric(horizontal: 15),
      child: Column(
        children: children
      ),
    );
  }


  Widget _buildHeader() {
    return Container(
      width: coverWidth,
      height: coverHeight,
      child: Stack(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(movieList[0].images.large),
            fit: BoxFit.fitWidth,
            height: coverHeight,
            width: coverWidth,
          ),
          Container(
              color: Color(0xbb000000), width: coverWidth, height: coverHeight),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
                width: coverWidth,
                height: coverHeight,
                padding:
                    EdgeInsets.fromLTRB(30, 54 + Screen.topSafeHeight, 10, 20),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      this.widget.subTitle,
                      style: TextStyle(color: AppColor.white),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Text(this.widget.title,
                        style: TextStyle(
                            color: AppColor.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold)),
                  ],
                )),
          ),
        ],
      ),
    );
  }

  Future<void> fetchData() async {
    if (_loaded) {
      return;
    }
    ApiClient client = new ApiClient();
    var data;
    String action = this.widget.action;
    switch (action) {
      case 'weekly':
        data = await client.getWeeklyList();
        break;
      case 'new_movies':
        data = await client.getNewMoviesList();
        break;
      case 'us_box':
        data = await client.getUsBoxList();
        break;
      case 'top250':
        data = await client.getTop250List(start: start, count: count);
        break;
      default:
        break;
    }
    setState(() {
      if (movieList == null) {
        movieList = [];
      }
      List<MovieItem> newMovies = MovieDataUtil.getMovieList(data);
      newMovies.forEach((movie) {
        movieList.add(movie);
      });
      if (this.widget.action == 'top250') {
        if (newMovies.length == 0) {
          _loaded = true;
          return;
        }
      } else {
        _loaded = true;
        return;
      }
      

      start = start + count;
    });
  }

}
