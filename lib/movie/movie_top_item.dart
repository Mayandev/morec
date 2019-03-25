import 'package:flutter/material.dart';

import 'movie_list_item.dart'; 
class MovieTopItem extends StatelessWidget {

  final int index;
  final MovieListItem item;

  const MovieTopItem({Key key, this.index, this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Color rankBgColor;

    switch (index) {
      case 1:
        rankBgColor = Color(0xffFF6678);
        break;
      case 2:
        rankBgColor = Color(0xffF98B56);
        break;
      case 3:
        rankBgColor = Color(0xffFFC05F);
        break;
      default:
        rankBgColor = Color(0xffD1CEC9);
        break;
    }

    return Container(
      color: Colors.white,
      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          
          Container(
            padding: EdgeInsets.all(5),
            margin: EdgeInsets.fromLTRB(15, 15, 0, 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(3)),
              color: rankBgColor,
            ),
            child: Text('No.$index', style: TextStyle(color: Colors.white, fontSize: 12),),
          ),
          item
        ],
      ),
      
    );
  }
}