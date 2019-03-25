import 'movie_rate.dart';
import 'movie_image.dart';
import 'movie_comment.dart';
import 'movie_actor.dart';
import 'movie_photo.dart';

/// 电影详情
class MovieDetail {

  MovieRate rating;   // 电影评分
  MovieImage images;  // 电影封面
  String year;        // 上映时间
  List<MovieComment> comments; // 评论
  String alt;         // 豆瓣网址
  String id;          // 电影 id
  String title;       // 电影标题
  List tags;  // 电影标签
  List genres;  // 电影类型
  List trailerUrls;  // 预告片 url
  List<MovieActor> casts;    // 演员
  List<MovieActor> directors; // 导演
  List countries;     // 国家
  List<MoviePhoto> photos;    // 剧照
  String summary;     // 电影简介

  MovieDetail(this.rating, this.images, this.year, this.comments, this.alt, this.id,
     this.title, this.tags, this.genres, this.trailerUrls, this.casts, this.directors,
     this.countries, this.photos);

  MovieDetail.fromJson(Map data) {
    rating = MovieRate.fromJson(data['rating']);
    images = MovieImage.fromJson(data['images']);
    year = data['year'];
    alt = data['alt'];
    id = data['id'];
    title = data['title'];
    tags = data['tags']?.cast<String>()?.toList();
    genres = data['genres']?.cast<String>()?.toList();
    trailerUrls = data['trailer_urls']?.cast<String>()?.toList();
    countries = data['countries']?.cast<String>()?.toList();
    
    List<MovieComment> commentData = [];
    List<MovieActor> castsData = [];
    List<MovieActor> directorsData = [];
    List<MoviePhoto> photosData = [];

    for (var i = 0; i < data['popular_comments'].length; i++) {
      commentData.add(MovieComment.fromJson(data['popular_comments'][i]));
    }
    for (var i = 0; i < data['casts'].length; i++) {
      castsData.add(MovieActor.fromJson(data['casts'][i]));
    }
    for (var i = 0; i < data['directors'].length; i++) {
      directorsData.add(MovieActor.fromJson(data['directors'][i]));
    }
    for (var i = 0; i < data['photos'].length; i++) {
      photosData.add(MoviePhoto.fromJson(data['photos'][i]));
    }

    comments = commentData;
    casts = castsData;
    directors = directorsData;  
    photos = photosData;

  }

}
