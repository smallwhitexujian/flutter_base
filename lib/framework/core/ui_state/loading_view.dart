import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  final Widget? _child;
  const LoadingView(this._child, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: _child ?? getWidget(),
    );
  }

  Widget getWidget() {
    return const CircularProgressIndicator(
      valueColor: AlwaysStoppedAnimation(
        Colors.blue,
      ),
    );
  }
}
