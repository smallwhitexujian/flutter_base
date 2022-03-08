import 'package:flutter/material.dart';
import 'package:flutter_base/app/route/routes_constants.dart';
import 'package:flutter_base/framework/lib_base.dart';

///路由配置表
///1. 首先需要注册[registerRoute] 注册表中填写注册信息
///2. 创建Handler  返回需要的widget
class RouteUtils {
  //注册,路由都需要注册相应的地址
  static void registerRoute(List<DefineConfig> list) {
    for (var item in RoutesConstants.list) {
      Routesimpl.getFluroRouter().define(
        item.url,
        handler: Handler(handlerFunc: (context, parameters) {
          return item.widget;
        }),
        transitionType: item.transitionType,
        transitionBuilder: item.transitionBuilder,
        transitionDuration:
            item.transitionDuration ?? const Duration(milliseconds: 250),
      );
    }
  }

  //----------------------------------------------------------------------------

  static Route? getGenerators(RouteSettings routeSettings) {
    return Routesimpl.getFluroRouter().generator(routeSettings);
  }

  static Future goNavigateTo(BuildContext context, String path,
      {Map<String, dynamic>? params,
      bool replace = false,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder? transitionBuilder}) {
    return Routesimpl.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }
}

///注册表
///
class DefineConfig {
  String url; //注册路径
  Widget widget; //指定的路径
  TransitionType? transitionType;
  Duration? transitionDuration;
  RouteTransitionsBuilder? transitionBuilder;

  DefineConfig(this.url, this.widget,
      {this.transitionType, this.transitionDuration, this.transitionBuilder});
}
