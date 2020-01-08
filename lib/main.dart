import 'package:flutter/material.dart';
import 'dart:async';
import 'src/app.dart';
import 'src/utils/sentry_handler.dart';

//void main() => runApp(App());

void main() => runZoned((){
    runApp(App());
}, onError: (Object error, StackTrace stackTrace) {
    SentryHandler().getSentryEvent(error, stackTrace);
});
