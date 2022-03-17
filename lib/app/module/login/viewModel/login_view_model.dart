import 'package:flutter_base/app/route/routes_constants.dart';
import 'package:flutter_base/framework/lib_base.dart';

class LoginViewModel extends BaseViewModel {
  LoginViewModel();

  Future<void>? goNext(content) {
    return RouteUtils.goNavigateTo(content, RoutesConstants.homePage,
        clearStack: true, replace: false);
  }
}
