import 'package:flutter_base/framework/lib_base.dart';

///cache 接口
abstract class CacheInterface {
  ///MMKV必须先初始化后才能使用。
  ///。
  ///一般情况下，应该在`main()`内部完成：
  ///请注意，您必须**等待**完成后才能使用。
  ///*您可以自定义MMKV的根目录，默认传入[rootDir]，`${document}/mmkv`。
  ///*您可以通过传入[logLevel]自定义MMKV的日志级别。
  ///您甚至可以通过传递[MMKVLogLevel.None]来关闭日志记录，我们不建议这样做。
  ///*如果您想在iOS上多进程使用MMKV，需要传入[groupDir]来设置group文件夹。
  ///Android会忽略[groupDir]。
  ///
  ///createMMKV
  ///获取唯一ID[mmapID]的MMKV实例。文件key
  ///* 如果您想要一个按用户的mmkv，您可以在[mmapID]内合并user-id。
  ///* 传入[MMKVMode.MULTI_PROCESS_MODE]即可获取多进程MMKV实例。
  ///* 您可以使用[cryptKey]进行加密，最大不能超过16个字节。
  ///* 您可以自定义文件的[rootDir]。修改文件存放路径
  init(String mmapID,
      {String? rootDir,
      String? groupDir,
      MMKVLogLevel logLevel = MMKVLogLevel.Info,
      MMKVMode mode = MMKVMode.SINGLE_PROCESS_MODE,
      String? cryptKey});

  saveBool(String key, bool value);

  ///当[value]不会大于普通int32时使用此选项。
  ///它效率更高，占用的空间更少。
  saveInt32(String key, int value);

  saveInt(String key, int value);

  saveString(String key, String value);

  saveDouble(String key, double value);

  saveBytes(String key, {String? value, MMBuffer? mmBuffer});

  String? getString(String key);

  int getInt(String key);

  int getInt32(String key);

  double getDouble(String key);

  bool getBool(String key);

  MMBuffer? getBytes(String key);

  void removeValues(List<String> keys);

  void removeValue(String key);

  void clear();
}
