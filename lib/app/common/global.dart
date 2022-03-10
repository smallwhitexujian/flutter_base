import 'package:flutter_base/app/common/service_api/app_config.dart';

class Global {
  //一些全局的变量会在这边配置
  static final AppConfig _appConfig = AppConfig();
  //初始化全局信息，会在APP启动时执行
  static Future init() async {}

  static AppConfig getAppConfig() {
    return _appConfig;
  }
}
