import 'package:movie_recommend/public.dart';


class MovieDataUtil {
  static List<MovieItem> getMovieList(var list) {
    List content = list;  
    List<MovieItem> movies = [];    
    content.forEach((data) {
      movies.add(MovieItem.fromJson(data));
    });     
    return movies;
  }

  static List<MoviePhoto> getPhotoList(var list) {
    List content = list;  
    List<MoviePhoto> photos = [];    
    content.forEach((data) {
      photos.add(MoviePhoto.fromJson(data));
    });     
    return photos;
  }
}