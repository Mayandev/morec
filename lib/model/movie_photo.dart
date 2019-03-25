/// 电影剧照
class MoviePhoto {
  String thumb;
  String image;
  String cover;
  String alt;
  String id;
  String icon;

  MoviePhoto(this.thumb, this.image, this.cover, this.alt, this.id, this.icon);

  MoviePhoto.fromJson(Map data) {
    thumb = data['thumb'];
    image = data['image'];
    cover = data['cover'];
    alt = data['alt'];
    id = data['id'];
    icon = data['icon'];
  }
}