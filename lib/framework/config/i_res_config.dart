import 'package:flutter/cupertino.dart';

class IResConfig {
  Widget? _loadErrorWidget;
  Widget? _loadLoadingWidget;
  Widget? _loadLoadEmptyWidget;

  Widget? configLoadErrorView() {
    return _loadErrorWidget;
  }

  ///加载错误展示Widget
  void setConfigLoadErrorWidget(Widget widget) {
    _loadErrorWidget = widget;
  }

  Widget? configLoadingWidget() {
    return _loadLoadingWidget;
  }

  ///加载中...展示Widget
  void setConfigLoadingWidget(Widget widget) {
    _loadLoadingWidget = widget;
  }

  Widget? configLoadEmptyWidget() {
    return _loadLoadEmptyWidget;
  }

  ///加载空数据展示Widget
  void setConfigLoadEmptyWidget(Widget widget) {
    _loadLoadEmptyWidget = widget;
  }
}
