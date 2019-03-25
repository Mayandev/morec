/// 电影封面图片

class MovieImage {
  String small;
  String large;
  String medium;

  MovieImage(this.small, this.medium, this.large);

  MovieImage.fromJson(Map data) {   
    small = data['small'];
    medium = data['medium'];
    large = data['large'];
  } 
}