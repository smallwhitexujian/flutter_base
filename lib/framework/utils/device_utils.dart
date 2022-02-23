import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';

class DeviceUtils {
  DeviceUtils._();

  static bool _isInit = false;

  ///手机型号
  static String? _model;

  ///手机品牌
  static String? _brand;

  ///系统版本
  static String? _osVersion;

  ///系统版本e.g: android 9
  static String? _osVersionStr;

  ///android or ios
  static String? _osType;

  static AndroidDeviceInfo? _androidDeviceInfo;
  static AndroidBuildVersion? _androidBuildVersion;

  static IosDeviceInfo? _iosDeviceInfo;

  static Future<AndroidDeviceInfo?> getAndroidDeviceInfo() async {
    await _initDeviceInfo();
    return _androidDeviceInfo;
  }

  static Future<AndroidBuildVersion?> getAndroidBuildVersion() async {
    await _initDeviceInfo();
    return _androidBuildVersion;
  }

  static Future<IosDeviceInfo?> getIosDeviceInfo() async {
    await _initDeviceInfo();
    return _iosDeviceInfo;
  }

  ///品牌
  static Future<String?> getBrand() async {
    await _initDeviceInfo();
    return _brand;
  }

  ///型号
  static Future<String?> getModel() async {
    await _initDeviceInfo();
    return _model;
  }

  ///android 9
  static Future<String?> getOsVersion() async {
    await _initDeviceInfo();
    return _osVersionStr;
  }

  ///系统类型
  static String? getOsType() {
    if (_osType == null || _osType!.isEmpty) {
      _osType = Platform.operatingSystem;
    }
    return _osType;
  }

  static Future<void> _initDeviceInfo() async {
    if (!_isInit) {
      _isInit = true;
      _osType = Platform.operatingSystem;

      DeviceInfoPlugin plugin = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        _androidDeviceInfo = await plugin.androidInfo;
        _androidBuildVersion = _androidDeviceInfo?.version;

        _osVersion = _androidBuildVersion?.release;
        _model = _androidDeviceInfo?.model;
        _brand = _androidDeviceInfo?.brand;
      } else if (Platform.isIOS) {
        IosDeviceInfo build = await plugin.iosInfo;
        _osVersion = build.systemVersion;
        _model = build.model;
        _brand = build.name;
      } else {
        _osVersion = 'unKnow';
        _model = 'unKnow';
        _brand = 'unKnow';
      }

      _osVersionStr = '$_osType  $_osVersion';
    }
  }

  static bool isIos() {
    return Platform.isIOS;
  }

  static bool isAndroid() {
    return Platform.isAndroid;
  }
}
