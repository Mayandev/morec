/// 电影简介 item

import 'movie_image.dart';
import 'movie_rate.dart';
import 'movie_actor.dart';

class MovieItem {
  List  genres;
  MovieRate rating;
  String title;
  String year;
  MovieImage images;
  String id;
  String mainlandPubdate;
  int collectCount;
  List<MovieActor> casts;
  List<MovieActor> directors;
  

  MovieItem(
      this.genres,
      this.title,
      this.year,
      this.images,
      this.id,
      this.rating,
      this.mainlandPubdate,
      this.collectCount,
      this.casts,
      this.directors,
  );

  MovieItem.fromJson(Map data) {
    id = data['id'];
    images = MovieImage.fromJson(data['images']);
    year = data['year'];
    title = data['title'];
    genres = data['genres']?.cast<String>()?.toList();
    rating =MovieRate.fromJson(data['rating']);
    mainlandPubdate = data['mainland_pubdate'];
    collectCount =data['collect_count'];

    List<MovieActor> castsData = [];
    List<MovieActor> directorsData = [];
    
    for (var i = 0; i < data['casts'].length; i++) {
      castsData.add(MovieActor.fromJson(data['casts'][i]));
    }
    for (var i = 0; i < data['directors'].length; i++) {
      directorsData.add(MovieActor.fromJson(data['directors'][i]));
    }
    casts = castsData;
    directors = directorsData;
  }
}