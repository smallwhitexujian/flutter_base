//Toast interface
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/framework/lib_base.dart';

abstract class ToastInterface {
  void showLong(String msg);

  void showShort(String msg);

  void showCenter(String msg);

  void showTop(String msg);

  void showBottom(String msg);

  void showCustom(Widget child,
      {ToastGravity? toastGravity, Duration? duration});

  void showToast(
      {required String msg, //展示内容
      Toast? toastLength, //持续时间
      int duration = 1, //持续时长for ios web
      double? fontSize, //字体大小
      ToastGravity? gravity, //Toast方位
      Color? backgroundColor, //背景颜色
      Color? textColor, //字体颜色
      bool webShowClose = false //是否展示web关闭按钮
      });

  void showToastForIosWeb(
      {required String msg, //展示内容
      Toast? toastLength, //持续时间
      int timeInSecForIosWeb = 1, //持续时长for ios web
      double? fontSize, //字体大小
      ToastGravity? gravity, //Toast方位
      Color? backgroundColor, //背景颜色
      Color? textColor, //字体颜色
      bool webShowClose = false //是否展示web关闭按钮
      });

  void cancelToast();
}
