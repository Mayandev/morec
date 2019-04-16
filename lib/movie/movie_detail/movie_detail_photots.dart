import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/widget/movie_photo_list.dart';

import 'package:movie_recommend/public.dart';



class MovieDetailPhotots extends StatelessWidget {

  final List<MovieTrailer> trailers;
  final List<MoviePhoto> photos;
  final String movieId;

  const MovieDetailPhotots(this.trailers, this.photos, this.movieId);


  @override
  Widget build(BuildContext context) {
    List<ImageProvider> providers = [];
    List<String> imageUrls = [];
    List<Widget> children = [];
    Widget showMore = Container(
      margin: EdgeInsets.only(left: 15, bottom: 15),
      
      child: GestureDetector(
        onTap: () {
          AppNavigator.push(context, MoviePhotoList(action: 'movie',id: movieId, title: '剧照',));
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Text('查看更多',style: TextStyle(fontSize: 12, color: AppColor.lightGrey),),
            Icon(Icons.keyboard_arrow_right, color: AppColor.lightGrey,),
          ],
        ),
      )
    );

    for (var i = 0; i < trailers.length; i++) {
      children.add(TrailerItem(trailers[i]));
    }

    for (var i = 0; i < photos.length; i++) {
      imageUrls.add(photos[i].image);
    }

    for (var i = 0; i < photos.length; i++) {
      children.add(PhotoItem(photos[i], i, providers, imageUrls));
      providers.add(CachedNetworkImageProvider(photos[i].image));
    }
  
    children.add(showMore);

    return Container(
      // padding: EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('预告片 / 剧照',
              style: TextStyle(
                fontSize: fixedFontSize(16),
                fontWeight: FontWeight.bold,
                color: AppColor.white
              )),
          ),
          SizedBox(height: 10,),
          SizedBox.fromSize(
            size: Size.fromHeight(120),
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: children
            ),
          )
        ],
      ),
    );
  }

}

class TrailerItem extends StatelessWidget {

  final MovieTrailer trailer;

  TrailerItem(this.trailer);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 15, bottom: 15),
      child:GestureDetector(
        onTap: () {
          AppNavigator.push(context, MovieVideoPlay(url: trailer.trailerUrl,));
        },
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image(
                image: CachedNetworkImageProvider(trailer.cover),
                width: 160.0,
                height: 120.0,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 160.0,
              height: 120.0,
              child: Center(
                child: Opacity(
                  opacity: 0.8,
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.black
                    ),
                    child: Center(
                      child: Icon(Icons.play_arrow, color:AppColor.white,),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  
}

class PhotoItem extends StatelessWidget {

  final MoviePhoto photo;
  final int index;
  final List<ImageProvider> providers;
  final List<String> imageUrls;

  const PhotoItem(this.photo, this.index, this.providers, this.imageUrls);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:15, bottom: 15),
      child: GestureDetector(
        onTap: () {
          AppNavigator.push(context, MoviePhotoPreview(providers: providers, index: index, imageUrls: imageUrls,));
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(4.0),
          child: Hero(
            tag: 'photo$index',
              child: Image(
              image: CachedNetworkImageProvider(photo.icon),
              width: 160.0,
              height: 120.0,
              fit: BoxFit.cover,
            ),
          )
        ),
      )
    );
  }
}