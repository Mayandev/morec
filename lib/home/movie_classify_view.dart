import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:movie_recommend/model/movie_item.dart';

import 'package:movie_recommend/public.dart';

import 'home_section_view.dart';
import 'movie_classify_item.dart';

class MovieClassifyView extends StatefulWidget {

  final String title;

  const MovieClassifyView({Key key, this.title}) : super(key: key);

  @override
  _MovieClassifyViewState createState() => _MovieClassifyViewState();
}

class _MovieClassifyViewState extends State<MovieClassifyView> with AutomaticKeepAliveClientMixin<MovieClassifyView>{

  var classifyMovieList;
  var tagList;


  @override
  Widget build(BuildContext context) {
    if (classifyMovieList == null) {
      return CupertinoActivityIndicator();
    }
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeSectionView(this.widget.title, 'search'),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Column(
              children: <Widget>[
                MovieClassiyItem(tagList[0], classifyMovieList[0]),
                MovieClassiyItem(tagList[1], classifyMovieList[1]),
                MovieClassiyItem(tagList[2], classifyMovieList[2]),
              ],
            ),
          ),
          Container(
            height: 10,
            color: Color(0xFFF5F5F5),
          )
        ],
      ),
    );
  }

  @override
  void initState() { 
    super.initState();
    fetchData();
  }

  // 加载数据
  Future<void> fetchData() async {
      ApiClient client = new ApiClient();
      // 获取标签
      List<String> tags = TagUtil.getRandomTag();
      List<List<MovieItem>> classifyMovies = [];
      List<MovieItem> classifyList = MovieDataUtil.getMovieList(await client.getSearchListByTag(tag: tags[0], start: 0, count: 3));
      List<MovieItem> regionList = MovieDataUtil.getMovieList(await client.getSearchListByTag(tag: tags[1], start: 0, count: 3));
      List<MovieItem> featureList = MovieDataUtil.getMovieList(await client.getSearchListByTag(tag: tags[2], start: 0, count: 3));  
      classifyMovies.addAll([classifyList, regionList, featureList]);
      setState(() { 
        classifyMovieList = classifyMovies;
        tagList = tags;
      });
  }

  @override
  bool get wantKeepAlive => true;
}
