import 'package:flutter/cupertino.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/route/i_router.dart';
import 'package:flutter_base/framework/widget/error_widgets.dart';

class BaseRouter {
  static FluroRouter? _fluroRouter;

  static FluroRouter? getRouter() {
    return _fluroRouter;
  }

  static void setRouter(FluroRouter fluroRouter) {
    _fluroRouter = fluroRouter;
    registerConfigureRouters();
  }

  static final List<IRouter> _mlistRouter = [];

  static void registerConfigureRouters() {
    // ignore: unnecessary_null_comparison
    if (_fluroRouter == null) {
      throw Exception("fluroRouter is null, please init router");
    }

    _fluroRouter!.notFoundHandler = Handler(
        handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      return ErrorWidgets.create().getErrorWidget(context!,
          const FlutterErrorDetails(exception: "router not found handler"));
    });

    for (var element in _mlistRouter) {
      element.initFluroRouter(_fluroRouter!);
    }
  }

  //添加模块路由
  static void setRouterList(IRouter router) {
    if (!_mlistRouter.contains(router)) {
      _mlistRouter.add(router);
    }
  }

  static void clearFluroRouter() {
    _mlistRouter.clear();
  }
}
