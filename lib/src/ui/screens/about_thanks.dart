import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/data/dimens.dart';

class AboutThanks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(padding: EdgeInsets.all(itemChangelogPadding), child: Text(thanks, style: const TextStyle(fontSize: 14.0))));
  }
}
