import 'package:flutter/material.dart';

class WidgetUtils {
  ///圆形背景
  ///[radius] 半径
  ///[color] 颜色
  static Widget cricleBg({double? radius, Color? color = Colors.white}) {
    return Container(
      width: radius ?? 200.0,
      height: radius ?? 200.0,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
