import 'package:flutter/material.dart';

class ErrorWidgets {
  ErrorWidgets.create();

  Widget getErrorWidget(
      BuildContext context, FlutterErrorDetails flutterErrorDetails) {
    return Scaffold(
        body: Container(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Column(children: [
        const Icon(
          Icons.error,
          color: Colors.red,
          size: 100,
        ),
        Text(
          flutterErrorDetails.exceptionAsString(),
          style: const TextStyle(color: Colors.blue, fontSize: 14),
          textAlign: TextAlign.start,
        )
      ]),
    ));
  }
}
