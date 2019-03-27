import 'movie_rate.dart';
import 'movie_image.dart';
import 'movie_comment.dart';
import 'movie_actor.dart';
import 'movie_photo.dart';
import 'movie_trailer.dart';

/// 电影详情
class MovieDetail {

  MovieRate rating;   // 电影评分
  String originalTitle; // 原标题
  MovieImage images;  // 电影封面
  String year;        // 上映年份
  List<MovieComment> comments; // 评论
  String alt;         // 豆瓣网址
  String id;          // 电影 id
  String title;       // 电影标题
  List pubdates;      // 上映日期
  List tags;  // 电影标签
  List durations;
  List genres;  // 电影类型
  List<MovieTrailer> trailers;  // 预告片 url
  List<MovieActor> casts;    // 演员
  List<MovieActor> directors; // 导演
  List countries;     // 国家
  List<MoviePhoto> photos;    // 剧照
  String summary;     // 电影简介

  MovieDetail(this.rating, this.originalTitle, this.images, this.year, this.comments, this.alt, this.id,
     this.title, this.pubdates, this.tags, this.durations, this.genres, this.trailers, this.casts, this.directors,
     this.countries, this.photos, this.summary);

  MovieDetail.fromJson(Map data) {
    rating = MovieRate.fromJson(data['rating']);
    originalTitle = data['original_title'];
    images = MovieImage.fromJson(data['images']);
    year = data['year'];
    alt = data['alt'];
    id = data['id'];
    title = data['title'];
    pubdates = data['pubdates']?.cast<String>()?.toList();
    tags = data['tags']?.cast<String>()?.toList();
    durations = data['durations']?.cast<String>()?.toList();
    genres = data['genres']?.cast<String>()?.toList();
    countries = data['countries']?.cast<String>()?.toList();
    summary = data['summary'];
    
    List<MovieComment> commentData = [];
    List<MovieActor> castsData = [];
    List<MovieActor> directorsData = [];
    List<MoviePhoto> photosData = [];
    List<MovieTrailer> trailerData = [];

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
    for (var i = 0; i < data['trailers'].length; i++) {
      trailerData.add(MovieTrailer.fromJson(data['trailers'][i]));
    }

    comments = commentData;
    casts = castsData;
    directors = directorsData;  
    photos = photosData;
    trailers = trailerData;
  }

}
