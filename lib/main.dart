import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'src/app.dart';
import 'src/utils/app_helper.dart';
import 'src/utils/sentry_handler.dart';


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
    SentryHandler().reportError(error, stackTrace);
});
