import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter_dio_module/lib_dio.dart';

abstract class FinalBaseViewModel extends ChangeNotifier {
  ///是否已经调用了dispose()方法
  bool _isDispose = false;

  bool get isDispose => _isDispose;

  ///是否正在请求中
  bool isLoading = false;

  RxDio rxDio = RxDio();

  ///保存请求token，用于页面关闭时取消请求
  List<CancelToken> cancelTokenList = [];

  ///通知ChangeNotifier 会触发addListener();
  ///addListener(() {
  ///    //数值改变的监听
  ///       print('YM------>新数值:${_counter.count}');
  ///    });
  @override
  void notifyListeners() {
    if (!_isDispose) {
      super.notifyListeners();
    } else {
      log("Warning this view is dispost() with after notifyListeners!!");
    }
  }

  ///页面关闭时回调该方式，释放资源
  @override
  void dispose() {
    super.dispose();
    rxDio.cancelList(cancelTokenList);
    _isDispose = true;
  }
}
