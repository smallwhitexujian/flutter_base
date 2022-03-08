import 'package:flutter_base/app/common/service_api/api_config.dart';
import 'package:flutter_base/app/route/route_utils.dart';
import 'package:flutter_base/app/route/routes_constants.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/viewModel/base_view_model.dart';

class SplashViewModel extends BaseViewModel {
  @override
  Map<String, dynamic>? getParam() {
    return null;
  }

  @override
  String getUrl() {
    return ApiConfig.proconfig;
  }

  @override
  CacheMode getCacheModel() {
    return CacheMode.DEFAULT;
  }

  @override
  Method getMethod() {
    return Method.Get;
  }

  Future<void>? goNext(content) {
    return RouteUtils.goNavigateTo(content, RoutesConstants.homePage,
        clearStack: true, replace: true);
  }
}
