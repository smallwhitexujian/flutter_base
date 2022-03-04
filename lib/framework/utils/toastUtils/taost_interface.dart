//Toast interface
import 'package:flutter/cupertino.dart';
import 'package:flutter_base/framework/lib_base.dart';

abstract class ToastInterface {
  void initToast(BuildContext? context, bool isDebug);

  void showLong(String msg);

  void showShort(String msg);

  void showCenter(String msg);

  void showTop(String msg);

  void showBottom(String msg);

  void showDebugView(String msg);

  void showCustom(Widget child,
      {ToastGravity? toastGravity, Duration? duration});

  void clear();

  void cancelToast();
}
