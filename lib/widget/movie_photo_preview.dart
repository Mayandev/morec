import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:photo_view/photo_view_gallery.dart';

class MoviePhotoPreview extends StatefulWidget {

  final List<ImageProvider> providers;
  final PageController pageController;
  final int index;

  MoviePhotoPreview({this.providers, this.index})  : pageController = PageController(initialPage: index);

  @override
  _MoviePhotoPreviewState createState() => _MoviePhotoPreviewState();
}

class _MoviePhotoPreviewState extends State<MoviePhotoPreview> {

  int currentIndex;

  @override
  void initState() {
    currentIndex = widget.index;
    super.initState();
  }

  void onPageChanged(int index) {
    setState(() {
      currentIndex = index;
    });
  }

    // 返回上个页面
  back() {
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    List<PhotoViewGalleryPageOptions> options = [];


    for (var i = 0; i < this.widget.providers.length; i++) {
      options.add(PhotoViewGalleryPageOptions(imageProvider: this.widget.providers[i], heroTag: 'photo$i'));
    }


    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            color: Colors.black
          ),
          constraints: BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          child: Stack(
            alignment: Alignment.bottomRight,
            children: <Widget>[
              PhotoViewGallery(
                scrollPhysics: const BouncingScrollPhysics(),
                pageOptions: options,
                pageController: widget.pageController,
                onPageChanged: onPageChanged,
                loadingChild: CupertinoActivityIndicator(),
              ),
              Container(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  "${currentIndex + 1} / ${this.widget.providers.length}",
                  style: const TextStyle(
                      color: Colors.white, fontSize: 16.0, decoration: null),
                ),
              )
            ],
          )),
    );
  }
}