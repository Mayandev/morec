import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';
class MovieDetailComment extends StatelessWidget {
  
  final List<MovieComment> comments;

  const MovieDetailComment(this.comments);





  @override
  Widget build(BuildContext context) {

    List<Widget> children = [];
    Widget noComment = Text('暂无短评', style: TextStyle(color: AppColor.white, fontSize: 14),);

    for (var i = 0; i < comments.length; i++) {
      children.add(CommentItemView(comments[i]));
    }

    if (comments.length == 0) {
      children.add(noComment);
    }

    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Color(0x66000000),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('短评', style: TextStyle(fontSize: 16, color: AppColor.white, fontWeight: FontWeight.bold),),
          SizedBox(height: 30.0,),
          Column(
            children: children,
          ),
        ],
      ),
    );
  }
}


class CommentItemView extends StatelessWidget {

  final MovieComment comment;

  const CommentItemView(this.comment);

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        border: Border(bottom: BorderSide(color: AppColor.grey, width: 0.5))
      ),
      margin: EdgeInsets.only(bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(comment.author.avatar),
                radius: 16.0,
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Text(comment.author.name, style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: AppColor.white),),
                  SizedBox(height: 3,),
                  Row(
                    children: <Widget>[
                      new StaticRatingBar(size: 12.0,rate: comment.rating.value),
                      SizedBox(width: 10,),
                      Text(comment.time.split(' ')[0], style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: AppColor.lightGrey),),
                    ],
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 15,),
          Text(comment.content, style: TextStyle(fontSize: 14, color: AppColor.white),),
          SizedBox(height: 15,),
          Row(

            children: <Widget>[
              Icon(Icons.thumb_up, color: AppColor.lightGrey,size: 12,),
              SizedBox(width: 5,),
              Text(number2Unit(comment.usefulCount), style: TextStyle(fontSize: 12, color: AppColor.lightGrey),),
            ],
          ),
          SizedBox(height: 15,),
        ],
      ),
    );
  }

  String number2Unit(int number) {
    double n;
    if (number >= 1000) {
      n =number / 1000;
      return n.toStringAsFixed(1) + 'k';
    }
    return number.toString();
  }
}