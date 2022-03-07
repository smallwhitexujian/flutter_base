import 'package:flutter/material.dart';

//
class LoadStateParentView extends StatelessWidget {
  final Widget _child;
  final VoidCallback? _callback;

  const LoadStateParentView(this._child, this._callback, {Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        _callback?.call();
      },
      child: Center(child: _child),
    );
  }
}
