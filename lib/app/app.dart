import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/generated/i18n.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

///应用入口 Application
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

    return SdkManager.initScreenUtil(() => MaterialApp(
          // Scaffold 定义导航头部和页面主要内容
          onGenerateRoute: RouteUtils.getGenerators, //指定路由启动页面默认root
          ///home 这里不需要设置如果设置了 router 默认跳转启动界面不生效。
          theme: ThemeData(
            //导航栏和状态栏的颜色
            primaryColor: Colors.white,
            //主题颜色
            primarySwatch: AppConstants.white,
          ),
          localizationsDelegates: const [
            I18n.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
      ///设置支持的语言
          supportedLocales: I18n.delegate.supportedLocales,
      ///设置默认展示语言
      localeResolutionCallback:
      I18n.delegate.resolution(fallback: const Locale('zh', 'CN')),
        ));
  }

  @override
  void dispose() {
    super.dispose();
    SdkManager.dispose();
  }
}
