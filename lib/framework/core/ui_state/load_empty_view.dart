import 'package:flutter/material.dart';

class LoadEmptyView extends StatelessWidget {
  final Widget? _child;
  const LoadEmptyView(this._child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return _child ??
        const Center(
          child: Text(
            '数据为空\n点击重新加载',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 16,
              color: Color(0xFFADADAD),
            ),
          ),
        );
  }
}
