
/// 评论者评分
class MovieCommentRate {
  double max;
  double value;
  double min;

  MovieCommentRate(this.max, this.value, this.min);

  MovieCommentRate.fromJson(Map data) {
    value = data['value'].toDouble();
    max = data['max'].toDouble();
    min = data['min'].toDouble();
  }
}