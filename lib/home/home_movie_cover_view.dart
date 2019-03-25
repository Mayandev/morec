import 'package:flutter/material.dart';

import 'package:movie_recommend/public.dart';

class HomeMovieCoverView extends StatelessWidget {
  final MovieItem movie;

  HomeMovieCoverView(this.movie);


  @override
  Widget build(BuildContext context) {
    // 单个电影的宽度
    // 一行放置 3 个 电影
    var width = (Screen.width - 15 * 4) / 3;

    return GestureDetector(
      onTap: () {
        AppNavigator.pushMovieDetail(context, movie);
      },
      child: Container(
        width: width,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieCoverImage(movie.images.small, width: width, height: width / 0.75,),
            SizedBox(height: 5,),
            Text(
              movie.title,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              maxLines: 1,
            ),
            SizedBox(height: 3,),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                new StaticRatingBar(size: 13.0,rate: movie.rating.average/2,),
                SizedBox(width: 5,),  
                Text(movie.rating.average.toString(),style: TextStyle(color: AppColor.grey, fontSize: 12.0),)
              ],
            ),
          ],
        ),
      ),
    );
  }
}