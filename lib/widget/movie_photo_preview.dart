import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:photo_view/photo_view.dart';

import 'dart:io';
import 'package:share/share.dart';
import 'package:image_picker_saver/image_picker_saver.dart';


import 'package:photo_view/photo_view_gallery.dart';
import 'package:movie_recommend/public.dart';

class MoviePhotoPreview extends StatefulWidget {

  final List<ImageProvider> providers;
  final PageController pageController;
  final int index;
  final List<String> imageUrls;

  MoviePhotoPreview({this.providers, this.imageUrls, this.index})  : pageController = PageController(initialPage: index);

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

  void _saveImageToAlbum(String imageUrl) async {
    print("_onImageSaveButtonPressed");
    Fluttertoast.showToast(msg: '正在保存...', backgroundColor: AppColor.darkGrey, textColor: Colors.white,);

    var response = await http
        .get(imageUrl);
    

    var filePath = await ImagePickerSaver.saveFile(
        fileData: response.bodyBytes);

    var savedFile= File.fromUri(Uri.file(filePath));
    Future<File>.sync(() => savedFile);
    Fluttertoast.showToast(msg: '保存成功', backgroundColor: AppColor.darkGrey, textColor: Colors.white,);


  }

  // 显示actionsheet 
  void showActionSheet({BuildContext context, Widget child}) {
    showCupertinoModalPopup<String>(
      context: context,
      builder: (BuildContext context) => child,
    ).then((String value) {
      print(value);
    });
  }

  @override
  Widget build(BuildContext context) {
    List<PhotoViewGalleryPageOptions> options = [];


    for (var i = 0; i < this.widget.providers.length; i++) {
      options.add(PhotoViewGalleryPageOptions(imageProvider: this.widget.providers[i], heroAttributes: PhotoViewHeroAttributes(tag: 'photo$i')));
    }


    return Scaffold(
      body: GestureDetector(
        onLongPress: () {
          showActionSheet(
            context: context,
            child: CupertinoActionSheet(
              actions: <Widget>[
              CupertinoActionSheetAction(
                child: const Text('分享图片链接'),
                onPressed: () {
                  Share.share(this.widget.imageUrls[currentIndex]);
                  Navigator.pop(context, '分享图片链接');
                },
              ),
              CupertinoActionSheetAction(
                child: const Text('保存图片至相册'),
                onPressed: () {
                  Navigator.pop(context, '保存图片至相册');
                  _saveImageToAlbum(this.widget.imageUrls[currentIndex]);
                },
              )],
              cancelButton: CupertinoActionSheetAction(
                child: const Text('取消'),
                isDefaultAction: true,
                onPressed: () {
                  Navigator.pop(context, '取消');
                },
              ),
            ),
          );
        },
        child: Container(
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
      ),
    );
  }
}