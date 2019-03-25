import 'dart:math' as math;

import 'package:movie_recommend/app/constant.dart';

class TagUtil {
  
  static List<String> getRandomTag() {
    List<String> tagList = [];
    var randomClassify = GenreList[math.Random().nextInt(GenreList.length)];
    var randomRegion = RegionList[math.Random().nextInt(RegionList.length)];
    var randomFeature = FeatureList[math.Random().nextInt(FeatureList.length)];
    tagList.addAll([randomClassify, randomRegion, randomFeature]);
    return tagList;
  }

}