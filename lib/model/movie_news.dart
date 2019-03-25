/// 首页新闻 banner
class MovieNews {
  String title;
  String cover;
  String summary;
  String link;

  MovieNews(this.title, this.cover, this.summary, this.link);

  MovieNews.fromJson(Map data) {
    title = data['title'];
    summary = data['summary'];
    cover = data['cover'];
    link = data['link'];
  }
}