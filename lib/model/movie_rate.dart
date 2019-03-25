/// 电影评分

class MovieRate {
  double max;
  double average;
  String stars;
  double min;

  MovieRate(this.max, this.average, this.stars, this.min);

  MovieRate.fromJson(Map data) {
    average = data['average']?.toDouble();
    max = data['max'].toDouble();
    stars = data['stars'];
    min = data['min'].toDouble();
  }
}