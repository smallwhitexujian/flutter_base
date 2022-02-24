import 'package:flutter_base/framework/lib_base.dart';

///权限请求
class PermissionUtils {
  PermissionUtils._();

  ///请求权限
  ///[permission] 当前要请求的权限
  ///[permanentlyDeniedToSetting] 用户永久拒绝不再提醒时是否进入应用设置页面
  static Future<bool> requestPermission(Permission permission,
      {bool permanentlyDeniedToSetting = true}) async {
    PermissionStatus status = await permission.request();
    if (PermissionStatus.permanentlyDenied == status) {
      ///用户永久拒绝不再提醒
      if (permanentlyDeniedToSetting) {
        openAppSettings();
      }
      return false;
    } else if (PermissionStatus.granted == status) {
      ///获取权限
      return true;
    } else {
      ///拒绝权限
      return false;
    }
  }
}
