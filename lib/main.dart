import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:info_malang_batu_flutter/src/app.dart';
import 'package:info_malang_batu_flutter/src/utils/app_helper.dart';
import 'package:info_malang_batu_flutter/src/utils/sentry_handler.dart';

void main() => runZoned<Future<void>>(() async {
    WidgetsFlutterBinding.ensureInitialized();
    FlutterError.onError = (FlutterErrorDetails details, {bool forceReport = false}) {
        if (isInDebugMode) {
            print('Main # Debug Mode No Sending Report to Sentry');
            FlutterError.dumpErrorToConsole(details);
        } else {
            Zone.current.handleUncaughtError(details.exception, details.stack);
        }
    };
    await SystemChrome.setPreferredOrientations(<DeviceOrientation>[DeviceOrientation.portraitUp]).then((_) {
        runApp(App());
    });
}, onError: (Object error, StackTrace stackTrace) {
    print('Main # oops error...');
    if (isInDebugMode) {
        print('Main # onError object -> ${error.toString()}');
        print('Main # onError stackTrace -> ${stackTrace.toString()}');
    } else {
        //SentryHandler().reportError(error, stackTrace);
    }
});