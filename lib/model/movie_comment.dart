import 'movie_comment_rate.dart';
import 'movie_comment_author.dart';

/// 评论
class MovieComment {
  MovieCommentRate rating;
  int usefulCount;
  MovieCommentAuthor author;
  String content;
  String time;
  String id;

  
  MovieComment(this.rating, this.usefulCount, this.author, this.content, this.time, this.id);

  MovieComment.fromJson(Map data) {
    rating = MovieCommentRate.fromJson(data['rating']);
    usefulCount = data['useful_count'];
    author = MovieCommentAuthor.fromJson(data['author']);
    content =data['content'];
    time = data['created_at'];
    id = data['id'];
  }

}