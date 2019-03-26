import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:movie_recommend/public.dart';

class MovieDetailTag extends StatelessWidget {
  final List tags;

  MovieDetailTag(this.tags);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text('所属频道',
              style: TextStyle(
                fontSize: fixedFontSize(16),
                fontWeight: FontWeight.bold,
                color: AppColor.white
              )),
          SizedBox(height: 10,),
          SizedBox.fromSize(
            size: Size.fromHeight(30.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: tags.length,
              itemBuilder: (BuildContext context, int index) {
                return _buildTag(tags[index]);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _buildTag(String tag) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        margin: EdgeInsets.only(right: 10),
        decoration: BoxDecoration(
          color: Color(0x66000000),  
          borderRadius: BorderRadius.all(Radius.circular(30))        
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(tag,
                style: TextStyle(
                    fontSize: fixedFontSize(12), color: AppColor.white)),
            Icon(Icons.chevron_right, color: AppColor.white,),
          ],
        ));
  }
}
