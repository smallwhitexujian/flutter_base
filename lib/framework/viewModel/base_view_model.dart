import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_base/framework/utils/toastUtils/toast_utils.dart';
import 'package:flutter_base/framework/viewModel/final_base_view_model.dart';

import '../lib_base.dart';

///baseViewmodel
abstract class BaseViewModel<T> extends FinalBaseViewModel {
  ///获取数据成功状态
  var _isLoadDateSuccess = false;

  ///获取数据失败状态
  var _isLoadDataFail = false;

  ///请求完成
  var _isComplete = false;

  ///changeNotify监听触发方法fun
  ChangeNotifyCallback? changeNotifyCallback;

  bool isLoadDateSuccess() {
    return _isLoadDateSuccess && isOnComplete();
  }

  bool isLoadDataFail() {
    return _isLoadDataFail;
  }

  bool isOnComplete() {
    return _isComplete;
  }

  T? _dataBean;

  StreamController<T>? _controller;
  BaseViewModel() {
    _controller = StreamController<T>();
  }

  StreamController? getController() {
    return _controller;
  }

  String getUrl() {
    return "";
  }

  ///缓存模型
  CacheMode getCacheModel() {
    return CacheMode.DEFAULT;
  }

  Method getMethod() {
    return Method.Post;
  }

  //参数配置
  Map<String, dynamic>? getParam() {
    return null;
  }

  ///网络请求部分
  doNewwrok(BuildContext context) {
    try {
      _isComplete = false;
      rxDio.setUrl(getUrl());
      rxDio.setCacheMode(getCacheModel());
      rxDio.setRequestMethod(getMethod());
      rxDio.setParams(getParam());
      rxDio.asStreams<T>().listen((event) {
        if (event.responseType == ResponseTypes.ERROR) {
          _isLoadDataFail = true;
          _isLoadDateSuccess = false;
          //错误统一处理
          ToastUtils()
            ..initToast(context)
            ..showDebugView("code :${event.statusCode},msg:${event.error}");
        }
        if (event.statusCode == 200) {
          //正常返回结果
          _isLoadDataFail = false;
          _isLoadDateSuccess = true;
          _dataBean = event.data;
          _controller?.add(event.data!);
        }
      });
    } on Exception catch (msg) {
      log(msg.toString());
      _isLoadDataFail = false;
    } finally {
      _isComplete = true;
    }

    // ///判断是否已经添加了通知监听器,如果没有添加则添加一个,如果已经添加则不需要再次添加
    // ///监听器作用就是使用viewModel.notifyListeners();既可以主动请求接口
    // if (changeNotifyCallback == null) {
    //   changeNotifyCallback = () {
    //     doNewwrok(context);
    //   };

    //   ///通过viewModel[notifyListeners] 通知到listener进行刷新
    //   ///addListener监听注册网络请求触发.
    //   addListener(changeNotifyCallback!);
    // }
  }

  ///请求是否成功
  bool isSuccess() {
    if (_isLoadDateSuccess && !_isLoadDataFail && _isComplete) {
      return _dataBean != null;
    } else {
      return false;
    }
  }

  ///请求是否失败
  bool isFail() {
    return !_isLoadDateSuccess && _isLoadDataFail;
  }

  ///请求数据是否为空
  bool isEmpty() {
    if (_isLoadDateSuccess && !_isLoadDataFail && _isComplete) {
      return _dataBean == null;
    } else {
      return _dataBean == null;
    }
  }

  @override
  void dispose() {
    _dataBean = null;
    if (!_controller!.isClosed) {
      _controller?.close();
    }
    super.dispose();
  }
}

typedef ChangeNotifyCallback = void Function();
