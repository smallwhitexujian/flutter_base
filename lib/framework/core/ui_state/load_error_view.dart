import 'package:flutter/material.dart';

class LoadErrorView extends StatelessWidget {
  final Widget? _child;
  const LoadErrorView(this._child, {Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return _child ??
        const Center(
          child: Text(
            '加载失败\n点击重新加载',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFADADAD),
            ),
          ),
        );
  }
}
