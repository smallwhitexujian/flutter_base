import 'package:flutter_base/framework/utils/mmkv/cache_constant.dart';
import 'package:flutter_base/framework/utils/mmkv/mmkv_utils.dart';

/// 软件开发环境切换
class EnvConfig {
  factory EnvConfig() => _getInstance();

  static final EnvConfig _instance = EnvConfig._internal();

  EnvConfig._internal();

  static EnvConfig _getInstance() {
    return _instance;
  }

  /// Env 开发换件切换配置，默认情况下配置为空即正式环境
  /// * [status] 表示当前App环境状态,默认传[EnvStatus.release]
  /// * [prohost] 表示正式环境地址默认为空
  /// * [devhost] 表示开发环境地址默认为空
  /// * [prehost] 表示预发布环境地址默认为空
  Future<void> initConfig(
      {EnvStatus status = EnvStatus.release,
      String prohost = "",
      String devhost = "",
      String prehost = ""}) async {
    if (status != EnvStatus.release) {
      _setEnvConfigStatus(status);
    }
    _setEnvHostConifg(hostPro: prohost, hostDev: devhost, hostPre: prehost);
  }

  ///保存状态库
  Future<void> _setEnvConfigStatus(EnvStatus env) async {
    MMKVUtils.instance.saveString(CacheConstant.evnstatus, env.name);
  }

  ///获取当前开发环境是开发,预发，还是生产
  Future<EnvStatus> getEnvConfigStatus() async {
    var num = MMKVUtils.instance.getString(CacheConstant.evnstatus);
    if (num != null) {
      if (num.contains(EnvStatus.dev.name)) {
        return EnvStatus.dev;
      } else if (num.contains(EnvStatus.pre.name)) {
        return EnvStatus.pre;
      } else {
        return EnvStatus.release;
      }
    }
    return EnvStatus.release;
  }

  ///获取当前环境是正式版本
  Future<bool> isReleaseEnvStatus() async {
    EnvStatus envStatus = await getEnvConfigStatus();
    return envStatus == EnvStatus.release;
  }

  ///获取hostUrl
  String getEnvHostUrl() {
    var num = MMKVUtils.instance.getString(CacheConstant.evnstatus);
    if (num != null) {
      if (num.contains(EnvStatus.dev.name)) {
        return _devHost;
      } else if (num.contains(EnvStatus.pre.name)) {
        return _preHost;
      } else {
        return _proHost;
      }
    }
    if (_proHost.isEmpty) {
      throw Exception("proHost must be null!! need init [initConfig]");
    }
    return _proHost;
  }

  ///是否显示切换服务器环境的UI
  ///什么情况下显示切换环境的按钮？
  ///isReleaseServerEnv=false时
  static bool isShowSwitchServerEnvUI() {
    return (MMKVUtils.instance.getString(CacheConstant.evnstatus) != null);
  }

  String _devHost = "";
  String _preHost = "";
  String _proHost = "";
  void _setEnvHostConifg(
      {String hostDev = "", String hostPre = "", required String hostPro}) {
    _devHost = hostDev;
    _preHost = hostPre;
    _proHost = hostPro;
  }
}

enum EnvStatus {
  //生产环境 development
  dev,
  //预发布 pre -release
  pre,
  //正式版本 release
  release
}
