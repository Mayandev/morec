import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/services.dart';

import 'dart:ui' as ui;

import 'package:movie_recommend/public.dart';

class MyScene extends StatefulWidget {
  _MySceneState createState() => _MySceneState();
}

class _MySceneState extends State<MyScene> with RouteAware{
  String avatarUrl =
      'https://ws2.sinaimg.cn/large/006tKfTcly1g1jsilob3pj30oe0oi7vc.jpg';

  @override
  void deactivate() {
    print('myscene deactivate');
    super.deactivate();
  }

  @override
  Widget build(BuildContext context) {
    print('my_scene build');
    Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);
    return Scaffold(
      body: Container(
          color: AppColor.white,
          height: Screen.height,
          width: Screen.width,
          child: ListView(
            padding: EdgeInsets.only(top: 0),
            children: <Widget>[
              _buildHeader(),
              _buildItem('images/icon_github.png', '项目地址', _openGithub),
              _buildItem('images/icon_qq.png', 'Flutter 技术群', _copyQQNumber),
              _buildItem('images/icon_wechat.png', '我的微信号', _copyWechatNumber),
              _buildItem('images/icon_account.png', '我的公众号', _copyOfficialAccountNumber),
              _buildItem('images/icon_API.png', 'API 文档', _openApi),
            ],
          )),
    );
  }

  _openGithub() {
    AppNavigator.push(context, WebViewScene(url: 'https://github.com/Mayandev/morec',title: 'Morec',));
  }

  _openApi() {
    AppNavigator.push(context, WebViewScene(url: 'https://github.com/Mayandev/morec/blob/master/API.md',title: 'Api',));
  }

  _copyQQNumber() {
    Clipboard.setData(ClipboardData(text:'693338726'));
    Toast.show('已复制 QQ 群号');
  }

  _copyOfficialAccountNumber() {
    Clipboard.setData(ClipboardData(text:'fever_code'));
    Toast.show('已复制微信公众号');
  }

  _copyWechatNumber() {
    Clipboard.setData(ClipboardData(text:'zmy1349571206'));
    Toast.show('已复制微信号');
  }

  Widget _buildItem(String icon, String text, onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 10),
        width: Screen.width,
        padding: EdgeInsets.symmetric(vertical: 15),
        decoration: BoxDecoration(
            border: Border(
                bottom: BorderSide(color: AppColor.lightGrey, width: 0.5))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Image.asset(
                  icon,
                  fit: BoxFit.cover,
                  height: 30,
                  width: 30,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  text,
                  style: TextStyle(fontSize: 16),
                )
              ],
            ),
            Icon(Icons.keyboard_arrow_right)
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    double width = Screen.width;
    double height = 250;
    return Container(
      width: width,
      height: height,
      child: Stack(
        children: <Widget>[
          Image(
            image: CachedNetworkImageProvider(avatarUrl),
            fit: BoxFit.cover,
            width: Screen.width,
            height: height,
          ),
          Opacity(
            opacity: 0.7,
            child: Container(
                color: Colors.black, width: Screen.width, height: height),
          ),
          BackdropFilter(
            filter: ui.ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
            child: Container(
                width: Screen.width,
                height: height,
                color: Colors.transparent,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(avatarUrl),
                      radius: 50.0,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('MayanDev',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: AppColor.white,
                        ))
                  ],
                )),
          ),
        ],
      ),
    );
  }
}
