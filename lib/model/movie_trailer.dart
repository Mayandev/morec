class MovieTrailer {
  String cover;
  String trailerUrl;
  String id;

  MovieTrailer(this.cover, this.id, this.trailerUrl);

  MovieTrailer.fromJson(Map data) {
    cover = data['medium'];
    trailerUrl = data['resource_url'];
    id = data['id'];
  }
}