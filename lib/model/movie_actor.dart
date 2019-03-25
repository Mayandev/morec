import 'package:movie_recommend/model/movie_image.dart';

/// 演员
class MovieActor {
  String alt;
  MovieImage avatars;
  String name;
  String id;

  MovieActor(this.id, this.alt, this.avatars, this.name);

  MovieActor.fromJson(Map data) {
    id = data['id'];
    alt = data['alt'];
    if (data['avatars'] != null) {
      avatars = MovieImage.fromJson(data['avatars']);
    }
    name = data['name'];
  }

}