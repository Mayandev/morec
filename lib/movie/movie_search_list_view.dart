import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


import 'package:movie_recommend/public.dart';
import 'movie_list_item.dart';

class MovieSearchListView extends StatefulWidget {

  final String keyWord;
  final String action;

  MovieSearchListView(this.keyWord, this.action);

  @override
  _MovieSearchListViewState createState() => _MovieSearchListViewState(keyWord, action);
}

class _MovieSearchListViewState extends State<MovieSearchListView> {

  String keyWord;
  String action;
  List<MovieItem> movieList;

  // 默认加载 20 条数据
  int start = 0, count = 20;

  bool _loaded = false;

  ScrollController _scrollController = ScrollController(); //listview的控制器

  _MovieSearchListViewState(this.keyWord, this.action);

  @override
  void initState() { 
    super.initState();
    fetchData();
    // 滚动监听注册
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
          // print('滑动到了最底部');
          fetchData();
      }
    });


  }

  @override
  Widget build(BuildContext context) {
      return _buildBody();
  }

  Widget _buildBody() {
    if (movieList == null) {
      return Center(
        child: CupertinoActivityIndicator(
        ),
      );
    }
    return Container(
        child: ListView.builder(
          itemCount: movieList.length,
          itemBuilder: (BuildContext context, int index) {
            if (index+1 == movieList.length) {
              return Container(
                padding: EdgeInsets.all(10),
                child: Center(
                  child: Offstage(
                    offstage: _loaded,
                    child: CupertinoActivityIndicator(),
                  ),
                ),
              );
            }
            return MovieListItem(movieList[index], action);
          },
          controller: _scrollController,
        ),
      );
  }


  Future<void> fetchData() async {
    if (_loaded) {
      return;
    }
    ApiClient client = new ApiClient();
    var data = await client.getSearchListByKey(key: keyWord, start: start, count: count);
    setState(() {
      if (movieList == null) {
        movieList = [];
      }
      List<MovieItem> newMovies = MovieDataUtil.getMovieList(data);
      if (newMovies.length == 0) {  
        _loaded = true;
        return;
      }
      newMovies.forEach((movie) {
        movieList.add(movie);
      });
      
      start = start + count;
    });
  }


   @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }
}