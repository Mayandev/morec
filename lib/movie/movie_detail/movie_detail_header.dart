import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:movie_recommend/public.dart';

import 'dart:ui' as ui;

class MovieDetailHeader extends StatelessWidget {
  
  final MovieDetail moviedDetail;
  final Color coverColor;

  const MovieDetailHeader(this.moviedDetail, this.coverColor);
  
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
            image: CachedNetworkImageProvider(moviedDetail.photos[0].image),
            fit: BoxFit.cover,
            width: width,
            height: height,
          ),
          Opacity(
            opacity: 0.8,
            child: Container(color: coverColor, width: width, height: height),
          ),
          buildContent(context),
        ],
      ),
    );
  }

  Widget buildContent(BuildContext context) {
    var width = Screen.width;
    var height = 218.0 + Screen.topSafeHeight;
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.fromLTRB(15, 54 + Screen.topSafeHeight, 10, 0),
      color: Colors.transparent,
      child: Row(
        
      ),
    );
  }
}