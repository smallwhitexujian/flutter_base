import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base/app/module/login/viewModel/login_view_model.dart';
import 'package:flutter_base/framework/core/base/base_stateful_view.dart';
import 'package:flutter_base/framework/lib_base.dart';
import 'package:flutter_base/framework/utils/dialog/dialog_utils.dart';
import 'package:flutter_base/framework/utils/toastUtils/toast_utils.dart';
import 'package:flutter_base/framework/widget/widget_uitls.dart';
import 'package:flutter_base/generated/i18n.dart';

class LoginView extends BaseStatefulView<LoginViewModel> {
  late LoginViewModel _viewModel;

  @override
  Widget buildView(BuildContext context) {
    //页面布局
    return Scaffold(
      resizeToAvoidBottomInset: false, // 解决键盘顶起页面
      //帧布局
      body: Stack(
        children: [
          //这个主要用于填满整个屏幕
          Positioned.fill(
            child: Image.asset(
              AssetsUtils.loadAssetsImg("login_bg", postfix: ".webp"),
              fit: BoxFit.fill,
              repeat: ImageRepeat.repeat,
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Padding(
              padding: const EdgeInsets.only(top: 120),
              child: Image.asset(AssetsUtils.loadAssetsImg("login_icon"),
                  width: 198),
            )
          ]),
          Column(
            children: [
              Expanded(child: Container()),
              Padding(
                  padding: const EdgeInsets.only(bottom: 74),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Padding(padding: EdgeInsets.only(left: 50)),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          ToastUtils()
                            ..initToast(context)
                            ..showShort("google");
                        }, //点击事件
                        child: Stack(
                          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                          children: [
                            WidgetUtils.cricleBg(radius: 56.0),
                            Image.asset(AssetsUtils.loadAssetsImg("ic_google"),
                                width: 40, height: 40),
                          ],
                        ),
                      )),
                      Expanded(
                          child: InkWell(
                        onTap: () {
                          ToastUtils()
                            ..initToast(context)
                            ..showShort("facebook");
                        }, //点击事件
                        child: Stack(
                          alignment: Alignment.center, //指定未定位或部分定位widget的对齐方式
                          children: [
                            WidgetUtils.cricleBg(radius: 56.0),
                            Image.asset(
                                AssetsUtils.loadAssetsImg("ic_facebook"),
                                width: 40,
                                height: 40),
                          ],
                        ),
                      )),
                      const Padding(padding: EdgeInsets.only(right: 50)),
                    ],
                  )),
              Padding(
                padding: const EdgeInsets.only(bottom: 36),
                child: Text.rich(TextSpan(
                    text: I18n.of(context).otherLogin,
                    recognizer: TapGestureRecognizer()
                      ..onTap = (() {
                        DialogUtils.showLoginDialog(() {
                          ToastUtils()
                            ..initToast(context)
                            ..showShort("close");
                        });
                      }),
                    style: const TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                        fontSize: 14.0))),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 40, right: 40, bottom: 24),
                child: Text.rich(TextSpan(
                  children: <InlineSpan>[
                    TextSpan(
                        text: I18n.of(context).tvPrivacyPolicy.substring(0, 38),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12.0)),
                    TextSpan(
                        text:
                            I18n.of(context).tvPrivacyPolicy.substring(38, 47),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            ToastUtils()
                              ..initToast(context)
                              ..showShort("Agreement");
                          }),
                        style: const TextStyle(
                            color: Color(0xFFff8c00),
                            decoration: TextDecoration.underline,
                            fontSize: 12.0)),
                    TextSpan(
                        text:
                            I18n.of(context).tvPrivacyPolicy.substring(47, 50),
                        style: const TextStyle(
                            color: Colors.white, fontSize: 12.0)),
                    TextSpan(
                        text: I18n.of(context).tvPrivacyPolicy.substring(50),
                        recognizer: TapGestureRecognizer()
                          ..onTap = (() {
                            ToastUtils()
                              ..initToast(context)
                              ..showShort("Privacy Policy");
                          }),
                        style: const TextStyle(
                          color: Color(0xFFff8c00),
                          decoration: TextDecoration.underline,
                          fontSize: 12.0,
                        ))
                  ],
                )),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  bool canLoading() {
    return true;
  }

  @override
  LoginViewModel createViewModel() {
    _viewModel = LoginViewModel();
    return _viewModel;
  }

  @override
  void dispose() {
    _viewModel.dispose();
  }

  @override
  void initState(BuildContext context) {}
}
