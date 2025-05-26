import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<String> loadJsonFromAsset(String assetPath) async {
  try {
    String jsonString = await rootBundle.loadString(assetPath);
    return jsonString;
  } catch (e) {
    debugPrint("JsonHelper # error $e");
    return '';
  }
}