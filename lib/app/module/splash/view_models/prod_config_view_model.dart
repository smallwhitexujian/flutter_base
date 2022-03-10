import 'package:flutter/material.dart';
import 'package:flutter_base/app/common/service_api/api_config.dart';
import '../../../../framework/lib_base.dart';

class ProdConfigViewModel<T> extends BaseViewModel<T> {
  ProdConfigViewModel(BuildContext context) {
    doNewwrok(context);
  }
  @override
  Map<String, dynamic>? getParam() {
    return null;
  }

  @override
  CacheMode getCacheModel() {
    return CacheMode.DEFAULT;
  }

  @override
  Method getMethod() {
    return Method.Get;
  }

  @override
  String getUrl() {
    return ApiConfig.proconfig;
  }
}
