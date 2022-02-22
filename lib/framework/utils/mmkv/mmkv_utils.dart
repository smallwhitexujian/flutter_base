//mmkv 工具类

import 'dart:convert';

import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/utils/mmkv/cache_interface.dart';

class MmkvUtils extends CacheInterface {
  late MMKV? mmkv;
  late var rootDir = "";

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
  @override
  init(String mmapID,
      {String? rootDir,
      String? groupDir,
      MMKVLogLevel logLevel = MMKVLogLevel.Info,
      MMKVMode mode = MMKVMode.SINGLE_PROCESS_MODE,
      String? cryptKey}) async {
    rootDir = await MMKV.initialize(
        logLevel: logLevel, rootDir: rootDir, groupDir: groupDir);
    if (rootDir.isNotEmpty) {
      if (mmapID.isEmpty) {
        _createMMKV("");
      } else {
        _createMMKV(mmapID, mode: mode, cryptKey: cryptKey, rootDir: rootDir);
      }
    }
  }

  ///获取唯一ID[mmapID]的MMKV实例。文件key
  ///* 如果您想要一个按用户的mmkv，您可以在[mmapID]内合并user-id。
  ///* 传入[MMKVMode.MULTI_PROCESS_MODE]即可获取多进程MMKV实例。
  ///* 您可以使用[cryptKey]进行加密，最大不能超过16个字节。
  ///* 您可以自定义文件的[rootDir]。修改文件存放路径
  MmkvUtils _createMMKV(String mmapID,
      {MMKVMode mode = MMKVMode.SINGLE_PROCESS_MODE,
      String? cryptKey,
      String? rootDir}) {
    if (mmapID.isEmpty) {
      ///默认存储路径.项目中所有key都会存在在一个文件里面
      /// *Note: If you come across to failing to load defaultMMKV() on
      /// *Android after upgrading Flutter from 1.20+ to 2.0+,
      /// *you can try passing this encryption key '\u{2}U' instead.
      mmkv = MMKV.defaultMMKV(cryptKey: "\u{2}U");
      return this;
    } else {
      mmkv = MMKV(mmapID, mode: mode, cryptKey: cryptKey, rootDir: rootDir);
      return this;
    }
  }

  //工厂管理instance对象 需要手动返回构造对象的时候就需要工厂模式，普通的方法返回默认创建对象
  factory MmkvUtils() => _getInstance();

  //重命名 instance 指代 _getInstance();
  static MmkvUtils get instance => _getInstance();

  //静态实例对象,用于存放唯一对象
  static MmkvUtils? _instance;

  //flutter无法初始化自己的构造函数,用私有方法重命名一个构造方法
  MmkvUtils._internal();

  //单例模式懒汉模式
  static MmkvUtils _getInstance() {
    _instance ??= MmkvUtils._internal();
    return _instance!;
  }

  @override
  void saveBool(String key, bool value) {
    mmkv?.encodeBool(key, value);
  }

  ///当[value]不会大于普通int32时使用此选项。
  ///它效率更高，占用的空间更少。
  @override
  void saveInt32(String key, int value) {
    mmkv?.encodeInt32(key, value);
  }

  @override
  void saveInt(String key, int value) {
    mmkv?.encodeInt(key, value);
  }

  @override
  void saveString(String key, String value) {
    mmkv?.encodeString(key, value);
  }

  @override
  void saveDouble(String key, double value) {
    mmkv?.encodeDouble(key, value);
  }

  @override
  void saveBytes(String key, {String? value, MMBuffer? mmBuffer}) {
    MMBuffer? bytes;
    if (value != null) {
      bytes = MMBuffer.fromList(const Utf8Encoder().convert(value))!;
    } else {
      bytes = mmBuffer;
    }
    mmkv?.encodeBytes(key, bytes);
    bytes?.destroy();
  }

  @override
  String? getString(String key) {
    return mmkv?.decodeString(key);
  }

  @override
  int getInt(String key) {
    if (mmkv == null) {
      throw Exception("mmkv is null");
    }
    return mmkv!.decodeInt(key);
  }

  @override
  int getInt32(String key) {
    if (mmkv == null) {
      throw Exception("mmkv is null");
    }
    return mmkv!.decodeInt32(key);
  }

  @override
  double getDouble(String key) {
    if (mmkv == null) {
      throw Exception("mmkv is null");
    }
    return mmkv!.decodeDouble(key);
  }

  @override
  bool getBool(String key) {
    if (mmkv == null) {
      throw Exception("mmkv is null");
    }
    return mmkv!.decodeBool(key);
  }

  @override
  MMBuffer? getBytes(String key) {
    if (mmkv == null) {
      throw Exception("mmkv is null");
    }
    return mmkv!.decodeBytes(key);
  }

  @override
  void clear() {
    mmkv?.clearAll();
  }

  @override
  void removeValue(String key) {
    mmkv?.removeValue(key);
  }

  @override
  void removeValues(List<String> keys) {
    mmkv?.removeValues(keys);
  }
}
