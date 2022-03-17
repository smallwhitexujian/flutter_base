import 'package:flutter_base/app/module/home/view/home_main.dart';
import 'package:flutter_base/app/module/login/view/login_view.dart';
import 'package:flutter_base/app/module/splash/view/splash_view.dart';
import 'package:flutter_base/framework/lib_base.dart';

///路由注册表
class RoutesConstants {
  static String root = '/';
  static String pdebugPage = '/debugPage';
  static String loginPage = '/loginPage';
  static String homePage = '/homePage';

  ///路由注册表注册表
  ///[url] 不能出现相同
  ///[widget] 必须要给
  static List<DefineConfig> list = [
    //启动界面
    DefineConfig(root, SplashView()),
    //登陆页面
    DefineConfig(loginPage, LoginView()),
    //首页
    DefineConfig(homePage, const HomeMain())
  ];
}
