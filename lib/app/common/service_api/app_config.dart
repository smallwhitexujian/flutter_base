import 'package:flutter_base/app/module/splash/bean/prod_config_json_entity.dart';
import 'package:flutter_base/framework/lib_base.dart';

class AppConfig {
  //配置一些App相关常量信息
  String appName = 'Nigo';
  var hosturl = "http://d.whqx1.com/";
  var baseH5 = "";
  var imSdkId = 0;
  var bigGroupId = "";

  void updateConfigBean(ProdConfigJsonEntity entity) {
    hosturl = entity.envConfig.apiUrl;
    baseH5 = entity.envConfig.h5Url;
    imSdkId = entity.imConfig.sdkappid;
    bigGroupId = entity.imConfig.bigGroupId;
    RxDioConfig.intstance.setHost(hosturl); //更新host
  }
}
