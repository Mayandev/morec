import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';

// 查看更多相册列表
class MoviePhotoList extends StatefulWidget {
  final String action;
  final String title;
  final String id;

  const MoviePhotoList({Key key, this.action, this.title, this.id})
      : super(key: key);

  @override
  _MoviePhotoListState createState() => _MoviePhotoListState();
}

class _MoviePhotoListState extends State<MoviePhotoList> {
  List<MoviePhoto> photos;
  ScrollController _scrollController = ScrollController();

  int start = 0;
  int count = 24;

  bool _loaded = false;

  void initState() {
    super.initState();
    fetchData();
    // 滚动监听注册
    _scrollController.addListener(() {
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        // print('滑动到了最底部');
        fetchData();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          brightness: Brightness.light,
          title: Text(this.widget.title),
          backgroundColor: AppColor.white,
          leading: GestureDetector(
            onTap: back,
            child: Image.asset('images/icon_arrow_back_black.png'),
          ),
          elevation: 0,
        ),
        body: _buildBody());
  }

  Widget _buildBody() {

    double photoWidth = (Screen.width - 2 * 2) / 3;
    if (photos == null) {
      return Center(
        child: CupertinoActivityIndicator(),
      );
    }
    List<Widget> children = [];
    List<ImageProvider> providers = [];
    List<String> imageUrls = [];
    for (var i = 0; i < photos.length; i++) {
      imageUrls.add(photos[i].image);
    }
    for (var i = 0; i < photos.length; i++) {
      children.add(
        GestureDetector(
          onTap: () {
            AppNavigator.push(context, MoviePhotoPreview(providers: providers, imageUrls: imageUrls, index: i,));
          },
          child: Hero(
            tag: 'photo$i',
              child: Image(
              image: CachedNetworkImageProvider(photos[i].icon),
              width: photoWidth,
              height: photoWidth,
              fit: BoxFit.cover,
            ),
          )
        )
      );
      providers.add(CachedNetworkImageProvider(photos[i].image));
      imageUrls.add(photos[i].image);
    }
    
    return CustomScrollView(
      controller: _scrollController,
      slivers: <Widget>[
        SliverGrid.count(
          crossAxisCount: 3,
          children: children,
          crossAxisSpacing: 2,
          mainAxisSpacing: 2,
        ),
        SliverToBoxAdapter(
          child: Container(
            padding: EdgeInsets.all(10),
            child: Offstage(
                    offstage: _loaded,
                    child: CupertinoActivityIndicator(),
                  ),
          )
        ),
      ],
    );
  }

  // 返回上个页面
  back() {
    Navigator.pop(context);
  }

  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    var data;
    String action = this.widget.action;
    switch (action) {
      case 'actor':
        data = await client.getActorPhotos(
            actorId: this.widget.id, start: start, count: count);
        break;
      case 'movie':
        data = await client.getMovieAlbum(
            movieId: this.widget.id, start: start, count: count);
        break;
    }

    setState(() {
       if (_loaded) {
          return;
        }
      if (photos == null) {
        photos = [];
      }
      List<MoviePhoto> newPhotos = MovieDataUtil.getPhotoList(data);
      if (newPhotos.length == 0 || newPhotos.length < count) {
        _loaded = true;
      }
      newPhotos.forEach((movie) {
        photos.add(movie);
      });

      start = start + count;
      count = count + 24;
    });
  }
}
