import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'package:movie_recommend/public.dart';

import 'package:movie_recommend/movie/movie_classify_section_view.dart';

class MovieClassifyListView extends StatefulWidget {


  @override
  _MovieClassifyListViewState createState() => _MovieClassifyListViewState();
}

class _MovieClassifyListViewState extends State<MovieClassifyListView> {



  @override
  void initState() { 
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text('分类找电影'),
          backgroundColor: AppColor.white,
          elevation: 0,
          leading: GestureDetector(
            onTap: back,
            child: Image.asset('images/icon_arrow_back_black.png'),
          ),
        ),
        body: Container(
          child: ListView(
            children: <Widget>[
              MovieClassifySectionView('类型'),
              MovieClassifySectionView('地区'),
              MovieClassifySectionView('特色'),
            ],
          ),
        )
      );
  }

  back() {
    Navigator.pop(context);
  }

  @override
  void dispose() {
    super.dispose();
  }
}