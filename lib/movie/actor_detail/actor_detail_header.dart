import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui' as ui;

import 'package:movie_recommend/public.dart';


class ActorDetailHeader extends StatelessWidget {
  final MovieActorDetail actorDetail;
  final Color coverColor;

  const ActorDetailHeader(this.actorDetail, this.coverColor);
  
  @override
  Widget build(BuildContext context) {
    var width = Screen.width;
    var height = 218.0 + Screen.topSafeHeight;

    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(actorDetail.photos.length == 0 ? actorDetail.avatars.large :actorDetail.photos[0].image),
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          Opacity(
            opacity: 0.7,
            child: Container(color: coverColor, width: width, height: height),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 1.0, sigmaY: 1.0),
            child: Container(
                width: width,
                height: height,
                padding:
                    EdgeInsets.fromLTRB(30, 54 + Screen.topSafeHeight, 10, 20),
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(actorDetail.avatars.large),
                      radius: 50.0,
                    ),
                    SizedBox(height: 10,),
                    Text(actorDetail.name, style:TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: AppColor.white, ))
                  ],
                )),
          ),
        ],
      ),
    );
  }


  String actor2String(List<MovieActor> actors) {
    StringBuffer sb = new StringBuffer();
    actors.forEach((actor) {
      sb.write(' ${actor.name} ');
    });
    return sb.toString();
  }

  String list2String(List list) {
    StringBuffer sb = new StringBuffer();
    list.forEach((item) {
      sb.write(' $item ');
    });
    return sb.toString();
  }

  String countries2String(List countries) {
    StringBuffer sb = new StringBuffer();
    countries.forEach((country) {
      sb.write('$country ');
    });
    return sb.toString();
  }
}