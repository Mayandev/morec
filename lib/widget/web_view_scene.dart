import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
import 'package:share/share.dart';

import 'package:movie_recommend/public.dart';
class WebViewScene extends StatefulWidget {
  final String url;
  final String title;

  WebViewScene({@required this.url, this.title});


  _WebViewSceneState createState() => _WebViewSceneState();
}

class _WebViewSceneState extends State<WebViewScene> {

  @override
  void deactivate() {
    print('webview deactivate');
    super.deactivate();
  }

  @override
  void dispose() {
    Screen.updateStatusBarStyle(SystemUiOverlayStyle.light);
    print('webview dispose');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WebviewScaffold(
      url: this.widget.url,

      appBar: AppBar(
        elevation: 0,
        title: Text(this.widget.title ?? ''),
        leading: GestureDetector(
            onTap: back,
            child: Image.asset('images/icon_arrow_back_black.png'),
          ),
        actions: <Widget>[
          GestureDetector(
            onTap: () {
              Share.share(this.widget.url);
            },
            child: Image.asset('images/icon_menu_share.png'),
          ),
        ],
      ),
      withZoom: true,
      withLocalStorage: true,
      hidden: true,
      initialChild: Container(
        child: const Center(
          child: CupertinoActivityIndicator()
        ),
      ),
    );
  }

   // 返回上个页面
  back() {
    Navigator.pop(context);
  }
}