import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';

import 'package:palette_generator/palette_generator.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';

import 'actor_detail_header.dart';
import 'actor_detail_summary.dart';
import 'actor_detail_works.dart';
import 'actor_detail_photos.dart';



class ActorDetailView extends StatefulWidget {
  // 影人 id
  final String id;
  const ActorDetailView({Key key, this.id}) : super(key: key);

  @override
  _ActorDetailViewState createState() => _ActorDetailViewState();
}

class _ActorDetailViewState extends State<ActorDetailView> {

  MovieActorDetail actorDetail;
  double navAlpha = 0;
  ScrollController scrollController = ScrollController();
  Color pageColor = AppColor.white;
  bool isSummaryUnfold = false;

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
    Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);

    if (actorDetail == null) {
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
          Container(
            color: pageColor,
            child: Column(
              children: <Widget>[
                Expanded(
                  child: ListView(
                    controller: scrollController,
                    padding: EdgeInsets.only(top: 0),
                    children: <Widget>[
                      ActorDetailHeader(actorDetail, pageColor),
                      ActorDetailSummary(actorDetail.summary, isSummaryUnfold, changeSummaryMaxLines),
                      ActorDetailWorks(actorDetail.works),
                      ActorDetailPhoto(actorDetail.photos, actorDetail.id),
                      // MovieDetailTag(movieDetail.tags),
                      // MovieSummaryView(movieDetail.summary, isSummaryUnfold, changeSummaryMaxLines),
                      // MovieDetailCastView(movieDetail.directors, movieDetail.casts),
                      // MovieDetailPhotots(movieDetail.trailers, movieDetail.photos),
                      // MovieDetailComment(movieDetail.comments)
                    ],
                  ),
                )
              ],
            ),
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
                    actorDetail.name,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.white),
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

  // 展开 or 收起
  changeSummaryMaxLines() {
    setState(() {
      isSummaryUnfold = !isSummaryUnfold;
    });
  }

  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    MovieActorDetail data =
        MovieActorDetail.fromJson(await client.getActorDetail(this.widget.id));
    PaletteGenerator paletteGenerator = await PaletteGenerator.fromImageProvider(
      CachedNetworkImageProvider(data.avatars.small),
    );
    setState(() {
      actorDetail = data;
      if (paletteGenerator.darkMutedColor != null) {
        pageColor = paletteGenerator.darkMutedColor.color;
      } else {
        pageColor = Color(0xff35374c);
      }
      // pageColor =paletteGenerator.dominantColor?.color;
    });
  }
}
