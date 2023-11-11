import 'package:flutter/material.dart';

bool get isInDebugMode {
  bool inDebugMode = false;
  assert(inDebugMode = true);
  return inDebugMode;
}

void showSnackBarSuccess(BuildContext context, String title) {
  final sb = SnackBar(
    content: Text(
      title,
      style: const TextStyle(color: Colors.white),
    ),
    backgroundColor: Colors.green[700],
  );
  ScaffoldMessenger.of(context).showSnackBar(sb);
}

void showSnackBarWarning(BuildContext context, String title) {
  final sb = SnackBar(
    content: Text(
      title,
      style: const TextStyle(color: Colors.black),
    ),
    backgroundColor: Colors.yellow[700],
  );
  ScaffoldMessenger.of(context).showSnackBar(sb);
}

void showSnackBarError(BuildContext context, String title) {
  final sb = SnackBar(
    content: Text(title),
    backgroundColor: Colors.red[700],
  );
  ScaffoldMessenger.of(context).showSnackBar(sb);
}
