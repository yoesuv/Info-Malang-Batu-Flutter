import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:info_malang_batu_flutter/src/app.dart';

void main() => runZoned<Future<void>>(() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]).then((_) {
    runApp(const App());
  });
});
