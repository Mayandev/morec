import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:movie_recommend/model/movie_item.dart';
import 'home_movie_cover_view.dart';

import 'package:movie_recommend/public.dart';


class MovieClassiyItem extends StatelessWidget {
  final String tag;
  final List<MovieItem> movies;

  MovieClassiyItem(this.tag, this.movies);

  @override
  Widget build(BuildContext context) {
    var children = movies.map((movie) => 
          HomeMovieCoverView(movie)).toList();
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              AppNavigator.pushMovieList(context, tag, 'search');
            },
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 8, 0, 8),
              child: Row(
                children: <Widget>[
                  Text(tag, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),),
                  Icon(CupertinoIcons.forward, size: 16,),
                ],
              ),
            )
          ),
          Wrap(spacing: 15, runSpacing: 20, children: children,),
        ],
      ),
    );
  }
}