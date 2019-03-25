import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:palette_generator/palette_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';

import 'movie_detail_header.dart';

class MovieDetailView extends StatefulWidget {
  // 电影 id
  final String id;

  const MovieDetailView({Key key, this.id}) : super(key: key);

  @override
  _MovieDetailViewState createState() => _MovieDetailViewState();
}

class _MovieDetailViewState extends State<MovieDetailView> {
  MovieDetail movieDetail;
  double navAlpha = 0;
  ScrollController scrollController = ScrollController();
  Color pageColor = AppColor.white;

  @override
  void initState() {
    super.initState();
    fetchData();

    scrollController.addListener(() {
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
  Widget build(BuildContext context) {
    if (movieDetail == null) {
      return Scaffold(
        appBar: AppBar(
          elevation: 0,
        ),
        body: Center(
          child: CupertinoActivityIndicator(
            radius: 15,
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
                    MovieDetailHeader(movieDetail, pageColor),
                  ],
                ),
              )
            ],
          ),
          // Container(color: pageColor,padding: EdgeInsets.symmetric(vertical: 300),),
          buildNavigationBar(),
        ],
      ),
    );
  }

  Widget buildNavigationBar() {
    return Stack(
      children: <Widget>[
        Container(
          width: 44,
          height: Screen.navigationBarHeight,
          padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
          child: GestureDetector(onTap: back, child: Image.asset('images/icon_arrow_back_white.png')),
        ),
        Opacity(
          opacity: navAlpha,
          child: Container(
            decoration: BoxDecoration(color: pageColor),
            padding: EdgeInsets.fromLTRB(5, Screen.topSafeHeight, 0, 0),
            height: Screen.navigationBarHeight,
            child: Row(
              children: <Widget>[
                Container(
                  width: 44,
                  child: GestureDetector(onTap: back, child: Image.asset('images/icon_arrow_back_white.png')),
                ),
                Expanded(
                  child: Text(
                    movieDetail.title,
                    style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
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

  // 返回上个页面
  back() {
    Navigator.pop(context);
  }

  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    MovieDetail data =
        MovieDetail.fromJson(await client.getMovieDetail(this.widget.id));
    PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(data.images.small),
    );
    setState(() {
      movieDetail = data;
      pageColor =paletteGenerator.dominantColor?.color;
    });
  }
}
