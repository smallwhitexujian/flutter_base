import 'package:flutter/material.dart';
import 'package:flutter_base/app/common/colors_constants.dart';
import 'package:flutter_base/framework/lib_base.dart';

class DialogUtils {
  static showLoginDialog(Function() close) {
    //target widget
    SmartDialog.show(
      isLoadingTemp: false,
      useSystem: true,
      alignmentTemp: Alignment.center,
      widget:
          //背景
          Container(
        height: 280,
        width: 260,
        decoration: BoxDecoration(
          //圆形背景
          borderRadius: BorderRadius.circular(20),
          color: const Color(ColorsConstants.hex_f7f7f7),
        ),
        child: Stack(
          children: [
            Align(
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: RichText(
                      text: const TextSpan(
                          text: "Account Login",
                          style: TextStyle(
                              color: Color(ColorsConstants.hex_292929),
                              fontWeight: FontWeight.w400,
                              fontSize: 20.0))),
                )),
            Align(
              child: IconButton(
                onPressed: () => {close(), SmartDialog.dismiss()},
                icon: const Icon(Icons.close),
              ),
              alignment: Alignment.topRight,
            ),
            Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.number, //输入的数字
                    autofocus: true,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      isCollapsed: true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10), //内容内边距，影响高度
                      border: const OutlineInputBorder(
                          borderRadius: //设置圆角
                              BorderRadius.all(Radius.circular(40))),
                      fillColor: Colors.white, //背景颜色，必须结合filled: true,才有效
                      filled: true, //重点，必须设置为true，fillColor才有效
                      // labelText: "用户名",
                      hintText: "Enter your User ID",
                      prefixIcon: Image.asset(
                        AssetsUtils.loadAssetsImg("account_no_empty"),
                        cacheWidth: 20,
                        cacheHeight: 20,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16, left: 20, right: 20),
                  child: TextField(
                    keyboardType: TextInputType.visiblePassword, //输入的数字
                    obscureText: true,
                    textAlignVertical: TextAlignVertical.center,
                    decoration: InputDecoration(
                      isCollapsed: true, //重点，相当于高度包裹的意思，必须设置为true，不然有默认奇妙的最小高度
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 10), //内容内边距，影响高度
                      border: const OutlineInputBorder(
                          borderRadius: //设置圆角
                              BorderRadius.all(Radius.circular(40))),
                      fillColor: Colors.white, //背景颜色，必须结合filled: true,才有效
                      filled: true, //重点，必须设置为true，fillColor才有效
                      // labelText: "用户名",
                      hintText: "Enter your password",
                      prefixIcon: Image.asset(
                        AssetsUtils.loadAssetsImg("password_no_empty"),
                        cacheWidth: 20,
                        cacheHeight: 20,
                        width: 20,
                        height: 20,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 24, right: 60, left: 60),
                  child: Builder(builder: (context) {
                    return ElevatedButton(
                      style: ButtonStyle(
                        minimumSize: MaterialStateProperty.all(
                            const Size(160, 40)), //设置按钮的大小
                        shape: MaterialStateProperty.all(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40))), //圆角
                        side: MaterialStateProperty.all(
                          const BorderSide(
                              color: Colors.white, width: 0.5), //边框
                        ),
                      ),
                      onPressed: () => {},
                      child: const Text('LOGIN'),
                    );
                  }),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
