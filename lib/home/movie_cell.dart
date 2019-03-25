import 'package:flutter/material.dart';

import 'package:movie_recommend/public.dart';

class MovieCell extends StatelessWidget {
  final MovieItem movie;

  MovieCell(this.movie);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        AppNavigator.pushMovieDetail(context, movie);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            MovieCoverImage(movie.images.small, width: 70, height: 93,),
            SizedBox(width: 15,),
            Expanded(
              child: buildRight(),
            )
          ],
        ),
      ),
    );
  }

  Widget buildRight() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          movie.title,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 5,),
        Text(
          ';;',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: 14,
            color: AppColor.grey,
          ),
        ),
        SizedBox(height: 5,),
        Row(
          children: buildTags(movie.genres, AppColor.grey)
        )
      ],
    );
  }

  List<Widget> buildTags(List<String> genres, Color color) {
    List<Widget> tags = [];
    genres.forEach((data) {
      tags.add(Container(
        padding: EdgeInsets.fromLTRB(5, 2, 5, 3),
        decoration: BoxDecoration(
        border: Border.all(color: Color.fromARGB(99, color.red, color.green, color.blue), width: 0.5),
        borderRadius: BorderRadius.circular(3),
      ),
      child: Text(
        data,
        style:TextStyle(fontSize: 11, color: color),
      ),
      ));
    });
    return tags;
  }
}