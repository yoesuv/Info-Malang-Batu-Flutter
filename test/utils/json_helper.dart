import 'dart:convert';

import 'package:flutter/services.dart';

Future<String> loadJsonFromAsset(String assetPath) async {
  String jsonString = await rootBundle.loadString(assetPath);
  return json.decode(jsonString);
}