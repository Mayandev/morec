
import 'movie_item.dart';

/// 演员影视作品
class MovieActorWork {

  List roles;
  MovieItem movie;

  MovieActorWork(this.movie, this.roles);

  MovieActorWork.fromJson(Map data) {
    roles = data['roles']?.cast<String>()?.toList();
    movie = MovieItem.fromJson(data['subject']);
  }

  
}