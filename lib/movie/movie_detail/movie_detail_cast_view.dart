import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';

import 'package:movie_recommend/movie/actor_detail/actor_detail_view.dart';

class MovieDetailCastView extends StatelessWidget {

  final List<MovieActor> directors;
  final List<MovieActor> actors;

  const MovieDetailCastView(this.directors, this.actors);

  @override
  Widget build(BuildContext context) {
    List<MovieActor> casts = [];
    directors.forEach((director) {
      casts.add(director);
    });

    actors.forEach((actor) {
      casts.add(actor);
    });

    return Container(
      // padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('演职员',
              style: TextStyle(
                fontSize: fixedFontSize(16),
                fontWeight: FontWeight.bold,
                color: AppColor.white
              )),
          ),
          SizedBox(height: 10,),
          SizedBox.fromSize(
            size: Size.fromHeight(130),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: directors.length + actors.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildCastView(context, index, casts);
             },
            ),
          )
        ],
      ),
    );

  }

  _buildCastView(BuildContext context, int index, List<MovieActor> casts) {
    MovieActor cast =casts[index];
    double paddingRight = 0.0;
    if (index == casts.length-1) {
      paddingRight = 15.0;
    }
        return Container(
          margin: EdgeInsets.only(left: 15, right: paddingRight),
      child: Column(
        children: [
          GestureDetector(
            onTap: () {
              if (cast.id == null) {
                Toast.show('暂无该演员信息');
              } else {
                AppNavigator.push(context, ActorDetailView(id:cast.id));
              }
            },
            child: CircleAvatar(
              backgroundImage: CachedNetworkImageProvider(cast.avatars.large),
              radius: 40.0,
            ),
          ),
          SizedBox(height: 8.0,),

          Container(
            width: 80,
            child: Center(
              child: Text(cast.name, style: TextStyle(fontSize: fixedFontSize(14), color: AppColor.white),maxLines: 1, overflow: TextOverflow.ellipsis,),
            ),
            
          ),
        ],
      ),
    );
  }
}