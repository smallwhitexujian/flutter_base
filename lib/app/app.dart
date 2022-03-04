import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/app/common/app_constants.dart';
import 'package:flutter_base/app/managers/sdk_manager.dart';

///应用入口 Application
///
class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _AppState();
  }
}

//全局状态管理初始化Application
class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    //初始化, SdkManager在这里初始化三方SDK
    SdkManager.init(context);
  }

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {
      ///设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
      SystemUiOverlayStyle systemUiOverlayStyle =
          const SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }

    return MaterialApp(
      // Scaffold 定义导航头部和页面主要内容
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true, // 标题居中
          title: const Text(AppConstants.appName),
          titleTextStyle: const TextStyle(color: Colors.black),
        ),
      ),
      theme: ThemeData(
        //导航栏和状态栏的颜色
        primaryColor: Colors.white,
        //主题颜色
        primarySwatch: AppConstants.white,
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    SdkManager.dispose();
  }
}
