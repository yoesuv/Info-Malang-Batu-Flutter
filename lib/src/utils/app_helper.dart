import 'package:flutter/material.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

void showSnackBarSuccess(BuildContext context, String title) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(title),
    backgroundColor: Colors.green[700],
  ));
}

void showSnackBarWarning(BuildContext context, String title) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(title, style: TextStyle(color: Colors.black)),
    backgroundColor: Colors.yellow[700],
  ));
}

void showSnackBarError(BuildContext context, String title) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(title),
    backgroundColor: Colors.red[700],
  ));
}
