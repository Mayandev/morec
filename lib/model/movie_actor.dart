import 'package:movie_recommend/model/movie_image.dart';

/// 演员
class MovieActor {
  String alt;
  MovieImage avatars;
  String name;
  String id;

  MovieActor(this.id, this.alt, this.avatars, this.name);

  MovieActor.fromJson(Map data) {
    String avatarPlaceholder = 'http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png';
    id = data['id'];
    alt = data['alt'];
    if (data['avatars'] == null) {
      avatars = new MovieImage(avatarPlaceholder, avatarPlaceholder, avatarPlaceholder);
    } else {
      avatars = MovieImage.fromJson(data['avatars']);
    }
    name = data['name'];
  }

}