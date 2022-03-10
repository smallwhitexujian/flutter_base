import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/common/service_api/api_config.dart';
import 'package:flutter_base/app/route/routes_constants.dart';
import 'package:flutter_base/framework/lib_base.dart';

class AutoLoginViewModel<T> extends BaseViewModel<T> {
  AutoLoginViewModel(BuildContext context) {
    doNewwrok(context);
  }

  @override
  Map<String, dynamic>? getParam() {
    return null;
  }

  @override
  String getUrl() {
    return ApiConfig.autoLogin;
  }

  Future<void>? goNext(content) {
    return RouteUtils.goNavigateTo(content, RoutesConstants.homePage,
        clearStack: true, replace: true);
  }
}
