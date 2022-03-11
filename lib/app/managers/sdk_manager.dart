import 'package:flutter/cupertino.dart';
import 'package:flutter_base/app/common/global.dart';
import 'package:flutter_base/app/route/routes_constants.dart';
import 'package:flutter_base/framework/base_lib_plugin.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/generated/json/base/json_convert_content.dart';

/// @data 初始化以及入口
/// @description 依赖的三方库管理工具
class SdkManager {
  //实例化
  SdkManager();

  static Future<void> init(BuildContext context) async {
    //注册表 注册
    RouteUtils.registerRoute(RoutesConstants.list);

    RxDioConfig()
      ..setDebugConfig(await _isDebug())
      ..setHost(Global.getAppConfig().hosturl)
      ..setJsonConvert(JsonConvertB()) //解析桥接
      ..setUserCacheConfig(true);

    ///一些三方库或者插件初始化
    await _initLibs(context);
  }

  static Future<void> _initLibs(BuildContext context) async {
    //初始路三方框架
    await BaseLibPlugin.init(isDebug: await _isDebug());
  }

  ///是否是debug模式，满足下面一个条件就认定是debug
  ///1、调试运行
  ///2、使用的测试服
  static Future<bool> _isDebug() async {
    return await EnvConfig().isReleaseEnvStatus();
  }

  ///应用关闭时调用
  static Future? dispose() async {
    return BaseLibPlugin.dispose();
  }

  ///初始化屏幕适配工具：方式一（初始化方法，使用其中一个即可）
  ///初始化并设置适配尺寸及字体大小是否根据系统的“字体大小”辅助选项来进行缩放
  ///https://github.com/OpenFlutter/flutter_screenutil/blob/master/README_CN.md
  static Widget initScreenUtil(Widget Function() builder) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      builder: builder,
    );
  }

  ///初始化屏幕适配工具：方式二
  ///不支持在MaterialApp的theme的textTheme中使用字体适配
  static void initScreenUtil2(BuildContext context) {
    ///设置尺寸（填写设计中设备的屏幕尺寸）如果设计基于360dp * 690dp的屏幕
    ScreenUtil.init(
      BoxConstraints(
        maxWidth: MediaQuery.of(context).size.width,
        maxHeight: MediaQuery.of(context).size.height,
      ),
      designSize: const Size(360, 690),
      orientation: Orientation.portrait,
    );
  }
}

class JsonConvertB extends IJsonConvert {
  @override
  M? fromJsonAsT<M>(json) {
    return JsonConvert.fromJsonAsT(json);
  }
}
