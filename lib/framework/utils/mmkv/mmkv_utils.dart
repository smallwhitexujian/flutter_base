//mmkv 工具类

import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/utils/mmkv/cache_interface.dart';

class MmkvUtils extends CacheInterface {
  late MMKV mmkv;

  MMKV init(String? path) {
    //默认存储路径
    return mmkv = MMKV.defaultMMKV(cryptKey: path);
  }

  @override
  saveBool(String key, bool value) {
    mmkv.encodeBool(key, value);
  }
}
