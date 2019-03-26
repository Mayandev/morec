import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';

import 'package:movie_recommend/public.dart';

class MovieClassifyTagItem extends StatefulWidget {
  final String tag;

  const MovieClassifyTagItem({Key key, this.tag}) : super(key: key);

  @override
  _MovieClassifyTagItemState createState() => _MovieClassifyTagItemState();
}

class _MovieClassifyTagItemState extends State<MovieClassifyTagItem> {
  String cover = 'https://ws2.sinaimg.cn/large/006tKfTcgy1g1bt7w7w9mj306e03kmx0.jpg';
  Color bgColor = Colors.black;

  @override
  void initState() {
    super.initState();
    fetchData();
  }

  @override
  Widget build(BuildContext context) {
    // 单个电影的宽度
    // 一行放置 3 个 tag
    double width = (Screen.width - 15 * 4) / 3;
    double height = width / 1.8;
    return GestureDetector(
      onTap: () {
        AppNavigator.pushMovieList(context, this.widget.tag, 'search');
      },
      child: Container(
        width: width,
        height: height,
        child: Stack(
          children: <Widget>[
            Container(
              width: width,
              height: height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: CachedNetworkImageProvider(cover),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(3))),
            ),
            Opacity(
              opacity: 0.6,
              child: Container(
                width: width,
                height: height,
                decoration: BoxDecoration(
                    color: bgColor,
                    borderRadius: BorderRadius.all(Radius.circular(3))),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              width: width,
              height: height,
              child: Center(
                child: Text(this.widget.tag, style: TextStyle(fontSize: 14, color: AppColor.white),),
              )
            ),
          ],
        ),
      ),
    );
  }

  Future<void> fetchData() async {
    ApiClient client = new ApiClient();
    var data = await client.getSearchListByTag(tag: this.widget.tag,start: 0, count: 1);
    setState(() {
      cover = data[0]['images']['small'];
    });
    // generator = await PaletteGenerator.fromImageProvider(CachedNetworkImageProvider(cover));
    // // setState(() {
    // //   bgColor = generator.darkMutedColor?.color;      
    // // });
  }
}
