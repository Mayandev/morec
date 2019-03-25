/// 电影评论作者
class MovieCommentAuthor {
  String uid;
  String avatar;
  String alt;
  String id;
  String name;
  
  MovieCommentAuthor(this.uid, this.avatar, this.alt, this.id, this.name);

  MovieCommentAuthor.fromJson(Map data) {
    uid = data['uid'];
    avatar = data['avatar'];
    alt = data['alt'];
    id = data['id'];
    name = data['name'];
  }

}