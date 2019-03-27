import 'package:flutter/material.dart';

import 'package:movie_recommend/public.dart';

import 'movie_classify_tag_item.dart';


class MovieClassifySectionView extends StatelessWidget {

  final String title;

  MovieClassifySectionView(this.title);

  @override
  Widget build(BuildContext context) {

    List<String> classifyList;

    switch (title) {
      case '类型':
        classifyList = GenreList;
        break;
      case '地区':
        classifyList = RegionList;
        break;
      case '特色':
        classifyList = FeatureList;
        break;
      default:
    }

    var children = classifyList.map((tag) => MovieClassifyTagItem(tag: tag,)).toList();

    return Container(
      color: AppColor.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Text(
              title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(15, 10, 0, 10),
            child: Wrap(spacing: 15, runSpacing: 20, children: children,),
          ),
        ]
      )
    );
  }
}