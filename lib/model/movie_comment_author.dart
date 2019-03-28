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
    if (data['avatar'] != null) {
      avatar = data['avatar'];
    } else {
      avatar = 'http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png';
    }
    alt = data['alt'];
    id = data['id'];
    name = data['name'];
  }

}