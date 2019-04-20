import 'package:flutter/material.dart';

import 'package:palette_generator/palette_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';
import 'movie_top_banner_view.dart';



class MovieTopScrollView extends StatefulWidget {

  final String title;

  const MovieTopScrollView({Key key, this.title}) : super(key: key);

  @override
  _MovieTopScrollViewState createState() => _MovieTopScrollViewState();
}

class _MovieTopScrollViewState extends State<MovieTopScrollView> with AutomaticKeepAliveClientMixin<MovieTopScrollView>{

  var weeklyList, top250List, usBoxList, newMovieList;
  List<MovieTopBanner> banners;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 0, 5),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  this.widget.title,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 5,),
                Container(
                  width: 80,
                  height: 2,
                  color: Colors.black,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
            child: MovieTopBannerView(banners),
            
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
      var weeklyData = MovieDataUtil.getMovieList(await client.getWeeklyList());
      var top250Data = MovieDataUtil.getMovieList(await client.getTop250List(start: 0, count: 10));
      var usBoxData = MovieDataUtil.getMovieList(await client.getUsBoxList());
      var newMovieData = MovieDataUtil.getMovieList(await client.getNewMoviesList());
      PaletteGenerator paletteGenerator1 = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(weeklyData[0].images.small));
      PaletteGenerator paletteGenerator2 = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(top250Data[0].images.small));
      PaletteGenerator paletteGenerator3 = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(newMovieData[0].images.small));
      PaletteGenerator paletteGenerator4 = await PaletteGenerator.fromImageProvider(
        CachedNetworkImageProvider(usBoxData[0].images.small));

      
      
      setState(() { 
        weeklyList = weeklyData;
        top250List = top250Data;
        usBoxList = usBoxData;
        newMovieList = newMovieData;
        banners = [
          new MovieTopBanner(weeklyList, '一周口碑电影榜', '每周五更新·共10部', 'weekly',paletteGenerator1.darkVibrantColor), 
          new MovieTopBanner(top250List, '豆瓣电影Top250', '豆瓣榜单·共250部', 'top250',paletteGenerator2.darkVibrantColor),
          new MovieTopBanner(newMovieList, '一周新电影榜', '每周五更新·共10部', 'new_movies',paletteGenerator3.darkVibrantColor), 
          new MovieTopBanner(usBoxList, '北美电影票房榜', '每周五更新·共10部', 'us_box',paletteGenerator4.darkVibrantColor)
        ];
      });
  }

  @override
  bool get wantKeepAlive => true;

}
