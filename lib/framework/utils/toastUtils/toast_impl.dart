//Toast 实现类
import 'package:flutter/material.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/utils/toastUtils/taost_interface.dart';

class ToastImpl extends ToastInterface {
  FToast? fToast;
  BuildContext? context;

  @override
  void initToast(BuildContext? context) {
    if (context != null) {
      this.context = context;
      fToast = FToast();
      fToast!.init(context);
    }
  }

  @override
  void showCenter(String msg) {
    showToast(msg: msg);
  }

  @override
  void showTop(String msg) {
    showToast(msg: msg, gravity: ToastGravity.TOP);
  }

  @override
  void showBottom(String msg) {
    showToast(msg: msg, gravity: ToastGravity.BOTTOM);
  }

  @override
  void showLong(String msg) {
    showToast(msg: msg, duration: 5);
  }

  @override
  void showShort(String msg) {
    showToast(msg: msg, duration: 1);
  }

  @override
  void showCustom(Widget child,
      {ToastGravity? toastGravity, Duration? duration}) {
    fToast?.showToast(
        child: child, //Widget布局
        gravity: toastGravity ??= ToastGravity.CENTER, //是否居中展示
        toastDuration: duration ??= const Duration(seconds: 1)); //持续时间
  }

  ///没有上下文的使用的Toast
  @override
  void showToastForIosWeb(
      {required String msg, //展示内容
      Toast? toastLength, //持续时间
      int timeInSecForIosWeb = 1, //持续时长for ios web
      double? fontSize, //字体大小
      ToastGravity? gravity, //Toast方位
      Color? backgroundColor, //背景颜色
      Color? textColor, //字体颜色
      bool webShowClose = false //是否展示web关闭按钮
      }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: toastLength ??= Toast.LENGTH_SHORT,
      timeInSecForIosWeb: timeInSecForIosWeb,
      fontSize: 16.0,
      gravity: gravity ??= ToastGravity.CENTER,
      backgroundColor: backgroundColor ??= Colors.black,
      textColor: textColor ??= Colors.white,
      webShowClose: webShowClose,
    );
  }

  @override
  void showToast(
      {required String msg, //展示内容
      Toast? toastLength, //持续时间
      int duration = 1, //持续时长 for ios web
      double? fontSize, //字体大小
      ToastGravity? gravity, //Toast方位
      Color? backgroundColor, //背景颜色
      Color? textColor, //字体颜色
      bool webShowClose = false //是否展示web关闭按钮
      }) {
    if (context == null) {
      showToastForIosWeb(
          msg: msg,
          toastLength: toastLength ??= Toast.LENGTH_SHORT,
          timeInSecForIosWeb: duration,
          fontSize: 16.0,
          gravity: gravity ??= ToastGravity.CENTER,
          backgroundColor: backgroundColor ??= Colors.black,
          textColor: textColor ??= Colors.white,
          webShowClose: webShowClose);
    } else {
      ///toast view展示
      Widget toast = Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min, //warp_content
        children: [
          Flexible(
              //防止界面超出
              child: Center(
                  child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10))),
            color: backgroundColor ??= Colors.black87,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
              child: Text(
                msg,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: fontSize ??= 16.0,
                    color: textColor ??= Colors.white),
              ),
            ),
          )))
        ],
      );
      showCustom(toast,
          toastGravity: gravity ??= ToastGravity.CENTER,
          duration: Duration(seconds: duration));
    }
  }

  @override
  void cancelToast() {
    if (context == null) {
      Fluttertoast.cancel();
    } else {
      fToast?.removeCustomToast();
    }
  }
}
