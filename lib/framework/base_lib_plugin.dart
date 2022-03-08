import 'package:flutter_base/framework/config/i_res_config.dart';
import 'package:flutter_base/framework/utils/toastUtils/taost_interface.dart';
import 'package:flutter_base/framework/utils/toastUtils/toast_utils.dart';

class BaseLibPlugin {
  //实例化
  BaseLibPlugin.create();

  //是否是debug模式
  static bool _isDebug = true;

  ///全局资源配置,用于存放默认资源和替换默认资源
  static IResConfig? _resConfig;

  static IResConfig? get resConfig => _resConfig;

  ///初始化基础库,应用启动时调用
  ///[isDebug] 是否是debug模式
  ///[logConfig] 日志库配置
  ///[httpConfig] http相关配置信息
  ///[resConfig] 全局通用资源配置
  ///[buglyConfig] bugly相关配置信息，为null不使用bugly
  ///[toastImpl] Toast相关配置，为null使用默认Toast样式
  static Future<void> init(
      {required bool isDebug,
      IResConfig? resConfig,
      ToastInterface? toast}) async {
    _isDebug = isDebug;
    _resConfig = resConfig;
    ToastUtils().initConfig(_isDebug, toast: toast);
  }

  ///应用关闭时调用该方法
  static Future<void> dispose() async {}
}
