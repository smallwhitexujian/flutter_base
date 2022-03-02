import 'package:flutter/widgets.dart';

import '../lib_base.dart';

class Routes {
  static FluroRouter router = FluroRouter();

  ///应用启动时初始化路由
  static void initRouters() {
    router.notFoundHandler =
        Handler(handlerFunc: (context, Map<String, List<String>> params) {
      throw Exception("ROUTE NOT FOUND");
    });
  }

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

    return router.navigateTo(
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
