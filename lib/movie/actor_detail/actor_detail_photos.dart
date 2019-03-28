import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';




class ActorDetailPhoto extends StatelessWidget {

  final List<MoviePhoto> photos;

  const ActorDetailPhoto(this.photos);


  @override
  Widget build(BuildContext context) {
    List<ImageProvider> providers = [];
    List<Widget> children = [];
    Widget showMore = Container(
      margin: EdgeInsets.only(left: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text('查看更多',style: TextStyle(fontSize: 12, color: AppColor.lightGrey),),
          Icon(Icons.keyboard_arrow_right, color: AppColor.lightGrey,),
        ],
      ),
    );


    for (var i = 0; i < photos.length; i++) {
      children.add(PhotoItem(photos[i], i, providers));
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
            child: Text('相册',
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


class PhotoItem extends StatelessWidget {

  final MoviePhoto photo;
  final int index;
  final List<ImageProvider> providers;

  const PhotoItem(this.photo, this.index, this.providers);

  

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left:15, bottom: 15),
      child: GestureDetector(
        onTap: () {
          AppNavigator.push(context, MoviePhotoPreview(providers: providers, index: index,));
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