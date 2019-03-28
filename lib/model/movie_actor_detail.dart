import 'movie_image.dart';
import 'movie_photo.dart';
import 'movie_actor_work.dart';

/// 演员详情
class MovieActorDetail {
  
  String name;
  String enName;
  String gender;
  List professions;
  MovieImage avatars;
  List<MoviePhoto> photos;    // 剧照
  String birthday;
  List aka; // 外号
  String bornPlace;
  String constellation; // 星座
  String id;
  List<MovieActorWork> works;
  String summary;


  MovieActorDetail(this.name, this.enName, this.gender, this.professions, this.avatars, 
    this.photos, this.birthday, this.aka, this.bornPlace, this.constellation, this.id, 
    this.works, this.summary);

  MovieActorDetail.fromJson(Map data) {
    String avatarPlaceholder = 'http://img3.doubanio.com/f/movie/ca527386eb8c4e325611e22dfcb04cc116d6b423/pics/movie/celebrity-default-small.png';    
    name = data['name'];
    enName = data['enName'];
    gender = data['gender'];
    professions = data['professions']?.cast<String>()?.toList();
    if (data['avatars'] == null) {
      avatars = new MovieImage(avatarPlaceholder, avatarPlaceholder, avatarPlaceholder);
    } else {
      avatars = MovieImage.fromJson(data['avatars']);
    }
    birthday = data['birthday'];
    aka = data['aka']?.cast<String>()?.toList();
    bornPlace = data['born_place'];
    constellation = data['constellation'];
    id = data['id'];
    summary = data['summary'];

    List<MoviePhoto> photosData = [];
    List<MovieActorWork> worksData = [];

    for (var i = 0; i < data['photos'].length; i++) {
      photosData.add(MoviePhoto.fromJson(data['photos'][i]));
    }

    for (var i = 0; i < data['works'].length; i++) {
      worksData.add(MovieActorWork.fromJson(data['works'][i]));
    }

    photos = photosData;
    works = worksData;


  }

}