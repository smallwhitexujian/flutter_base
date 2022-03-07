import 'package:flutter_base/app/module/splash/view/splash_view.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/route/routes.dart';

///路由配置表
///1. 首先需要注册[registerRoute] 注册表中填写注册信息
///2. 创建Handler  返回需要的widget
class RouteUtils {
  static String root = '/';
  static String debugPage = '/debugPage';
  static String loginPage = '/loginPage';
  static String homePage = '/homePage';

  //注册,路由都需要注册相应的地址
  static void registerRoute() {
    Routes.getFluroRouter().define(root,
        handler: rootHandler, transitionType: TransitionType.fadeIn);
  }
  //----------------------------------------------------------------------------

  ///启动页
  static var rootHandler = Handler(handlerFunc: (context, parameters) {
    return const SplashView();
  });
}
