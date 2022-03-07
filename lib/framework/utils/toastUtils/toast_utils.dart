import 'package:flutter/widgets.dart';
import 'package:flutter_base/framework/utils/toastUtils/taost_interface.dart';
import 'package:flutter_base/framework/utils/toastUtils/toast_impl.dart';
import 'package:fluttertoast/fluttertoast.dart';

///toast
class ToastUtils extends ToastInterface {
  ToastUtils();

  static ToastInterface? toastImpl = ToastImpl();

  void init(bool isDebug, {ToastInterface? toast}) {
    if (toast != null) {
      toastImpl = toast;
    }
    setDebugState(isDebug);
  }

  @override
  void setDebugState(bool isdebug) {
    toastImpl?.setDebugState(isdebug);
  }

  @override
  void initToast(BuildContext? context) {
    toastImpl?.initToast(context);
  }

  @override
  void cancelToast() {
    toastImpl?.cancelToast();
  }

  @override
  void showBottom(String msg) {
    toastImpl?.showBottom(msg);
  }

  @override
  void showCenter(String msg) {
    toastImpl?.showCenter(msg);
  }

  @override
  void showCustom(Widget child,
      {ToastGravity? toastGravity, Duration? duration}) {
    toastImpl?.showCustom(child,
        toastGravity: toastGravity, duration: duration);
  }

  @override
  void showDebugView(String msg) {
    toastImpl?.showDebugView(msg);
  }

  @override
  void showLong(String msg) {
    toastImpl?.showLong(msg);
  }

  @override
  void showShort(String msg) {
    toastImpl?.showShort(msg);
  }

  @override
  void showTop(String msg) {
    toastImpl?.showTop(msg);
  }

  @override
  void clear() {
    toastImpl?.clear();
  }
}
