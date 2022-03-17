import 'package:flutter/material.dart';

class AssetsUtils {
  AssetsUtils();

  ///获取assets图片资源的全路径
  ///[imageName] 图片名称不含后缀，e.g: logo
  ///[postfix] 图片后缀: .png
  static String loadAssetsImg(String imageName, {String postfix = '.png'}) {
    if (imageName.startsWith("images/")) {
      return imageName;
    } else {
      return 'images/$imageName$postfix';
    }
  }

  ///圆形网络头像
  ///[imgsrc] 网络地址
  static Widget circleAvatar(String imgsrc, {double? radius}) {
    return Container(
      width: radius ?? 200.0,
      height: radius ?? 200.0,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: NetworkImage(imgsrc), fit: BoxFit.cover),
        shape: BoxShape.circle,
      ),
    );
  }

  ///圆角网络头像
  ///[imgsrc] 网络地址
  static Widget circularAvatar(String imgsrc,
      {double radius = 200.0, double fillet = 20.0}) {
    return Container(
      width: radius,
      height: radius,
      margin: const EdgeInsets.all(20.0),
      decoration: BoxDecoration(
        color: Colors.white,
        image: DecorationImage(image: NetworkImage(imgsrc), fit: BoxFit.cover),
        shape: BoxShape.rectangle, // <-- 这里需要设置为 rectangle
        borderRadius: BorderRadius.all(
          Radius.circular(fillet), // <-- rectangle 时，BorderRadius 才有效
        ),
      ),
    );
  }
}
