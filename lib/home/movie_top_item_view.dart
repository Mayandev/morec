import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:palette_generator/palette_generator.dart';

import 'package:movie_recommend/model/movie_item.dart';
import 'package:movie_recommend/public.dart';

class MovieTopItemView extends StatelessWidget {
  final List<MovieItem> movies;
  final String title;
  final String subTitle;
  final PaletteColor coverColor;

  MovieTopItemView(this.movies, this.title, this.subTitle, this.coverColor);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          new Container(
            child: new Stack(
              children: <Widget>[
                Container(
                  width: Screen.width,
                  height: 100,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: CachedNetworkImageProvider(movies[0].images.medium),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5))
                  ),
                ),
                Opacity(
                  opacity: 0.6,
                  child: Container(
                    width: Screen.width,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(5),topRight: Radius.circular(5))
                    ),
                  ),
                  
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
                  width: Screen.width,
                  height: 100,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        subTitle,
                        style: TextStyle(color: AppColor.white),
                      ),
                      Text(title,
                          style: TextStyle(
                              color: AppColor.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          
          new Expanded(
              child: new Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: this.coverColor == null ? Color(0xff3E454D) : this.coverColor.color,
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5), bottomRight: Radius.circular(5))
              ),
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (BuildContext context, int index) {
                  return buildRank(context, index);
                },
              ),
            )
          ),
        ],
      ),
    );
  }

  Widget buildRank(BuildContext context, int rank) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 5, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            width: 100,
            child: Text(
              '${rank + 1}. ${movies[rank].title}',
              style: TextStyle(color: AppColor.white, fontSize: 12),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              new StaticRatingBar(size: 10.0,rate: movies[rank].rating.average/2,),
              SizedBox(width: 10,),
              Text('${movies[rank].rating.average}', style: TextStyle(color: AppColor.white, fontSize: 12),)
            ],
          )
        ],
      ),
    ); 
    
  }
}
