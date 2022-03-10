import 'package:flutter/material.dart';
import 'package:flutter_base/app/app.dart';
import 'package:flutter_base/app/common/Global.dart';

///应用入口函数
void main() {
  Global.init().then((e) => runApp(const App()));
}
