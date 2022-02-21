/// 软件开发环境切换
class EnvConfig {
  void setEnvConfig(EnvStatus env) {}

  void getEnvConfig(args) {}
}

enum EnvStatus {
  //生产环境 development
  dev,
  //预发布 pre -release
  pre,
  //正式版本 release
  release
}
