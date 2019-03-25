import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';

import 'package:movie_recommend/app/app_scence.dart';

void main() {
  runApp(AppScene());
  if (Platform.isAndroid) {
    // 设置沉浸式状态栏
    SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    
  }
}