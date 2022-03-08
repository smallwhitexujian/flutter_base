import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ScreenUtils {
  ScreenUtils();

  ///获取通用演示按钮
  static Widget getButton(String text, VoidCallback? onPressed) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: RaisedButton(
        textColor: Colors.white,
        color: Colors.blue,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Text(
            text,
            textAlign: TextAlign.center,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }

  ///屏幕宽度：dp
  static double get screenWidth {
    return ScreenUtil().screenWidth;
  }

  ///屏幕高度：dp
  ///获取的是实际可用的高度（已经减去了底部导航栏的高度）
  static double get screenHeight {
    return ScreenUtil().screenHeight;
  }

  ///状态栏：dp
  static double get statusBarHeight {
    return ScreenUtil().statusBarHeight;
  }

  ///底部安全区距离：dp
  ///适用于全面屏下面有按键的
  static double get bottomBarHeight {
    return ScreenUtil().bottomBarHeight;
  }

  ///设备的像素密度：（一个dp包含几个px）
  static double? get pixelRatio {
    return ScreenUtil().pixelRatio;
  }

  ///系统字体缩放比例
  static double get textScaleFactor {
    return ScreenUtil().textScaleFactor;
  }

  ///获取屏幕信息
  static String get screenInfoDesc {
    return '屏幕高度（实际可用）：${ScreenUtils.screenHeight}\n'
        '屏幕宽度：${ScreenUtils.screenWidth}\n'
        '状态栏高度：${ScreenUtils.statusBarHeight}\n'
        '底部导航高度：${ScreenUtils.bottomBarHeight}\n'
        '像素密度：${ScreenUtils.pixelRatio}\n'
        '系统字体缩放比例：${ScreenUtils.textScaleFactor}\n';
  }
}
