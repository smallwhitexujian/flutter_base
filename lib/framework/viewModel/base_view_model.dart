import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:flutter_base/framework/utils/toastUtils/toast_utils.dart';
import 'package:flutter_base/framework/viewModel/final_base_view_model.dart';

import '../lib_base.dart';

///baseViewmodel
abstract class BaseViewModel<T> extends FinalBaseViewModel {
  StreamController<T>? _controller;
  BaseViewModel() {
    _controller = StreamController<T>();
  }

  String getUrl();

  ///缓存模型
  CacheMode getCacheModel() {
    return CacheMode.DEFAULT;
  }

  Method getMethod() {
    return Method.Post;
  }

  //参数配置
  Map<String, dynamic> getParam();

  ///网络请求部分
  doNewwrok(BuildContext context) {
    rxDio.setUrl(getUrl());
    rxDio.setCacheMode(getCacheModel());
    rxDio.setRequestMethod(getMethod());
    rxDio.setParams(getParam());
    rxDio.asStreams<T>().listen((event) {
      if (event.responseType == ResponseTypes.ERROR) {
        //错误统一处理
        ToastUtils()
          ..initToast(context, true)
          ..showDebugView("code :${event.statusCode},msg:${event.error}");
      }
      if (event.statusCode == 200) {
        //正常返回结果
        _controller?.add(event.data!);
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.close();
  }
}
