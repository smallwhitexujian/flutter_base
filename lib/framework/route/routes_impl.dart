import 'package:flutter/widgets.dart';

import '../lib_base.dart';

class Routesimpl {
  static final FluroRouter _router = FluroRouter();

  static FluroRouter getFluroRouter() {
    return _router;
  }

  ///应用启动时初始化路由
  static void initRouters() {
    _router.notFoundHandler =
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      throw Exception("ROUTE NOT FOUND");
    });
  }

  ///[TransitionType]给页面进入时配置一个入场动画
  ///TransitionType.inFromLeft //左侧进入
  ///TransitionType.inFromRight //右侧进入
  ///TransitionType.inFromBottom //底部进入 默认入场动画
  ///TransitionType.native //无进入动画
  ///TransitionType.nativeModal //同上
  ///TransitionType.fadeIn //渐显动画
  ///TransitionType.custom //自定义
  ///TransitionType.material //感觉和上面几种一样 无特别动画效果
  ///TransitionType.materialFullScreenDialog //感觉和上面几种一样 无特别动画效果
  ///TransitionType.cupertino //右进右出
  ///TransitionType.cupertinoFullScreenDialog //底部进 底部出 下个页面返回值变化
  ///[transitionDuration] 入场动画执行时间
  ///[transitionBuilder] 自定义入场动画
  ///[clearStack] 是否退出当前页面
  ///[replace]
  ///[path] 地址
  ///对参数进行encode，解决参数中有特殊字符，影响fluro路由匹配
  ///所有页面跳转通过该方法，便于统一管理
  static Future navigateTo(BuildContext context, String path,
      {Map<String, dynamic>? params,
      bool replace = false,
      bool clearStack = false,
      TransitionType transition = TransitionType.fadeIn,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder? transitionBuilder}) {
    if (params != null) {
      String query = "";
      int index = 0;
      for (var key in params.keys) {
        var value = Uri.encodeComponent(params[key].toString());
        if (index == 0) {
          query = "?";
        } else {
          query = query + "\&";
        }
        query += "$key=$value";
        index++;
      }
      path = path + query;
    }

    return _router.navigateTo(
      context,
      path,
      replace: replace,
      clearStack: clearStack,
      transition: transition,
      transitionDuration: transitionDuration,
      transitionBuilder: transitionBuilder,
    );
  }
}
