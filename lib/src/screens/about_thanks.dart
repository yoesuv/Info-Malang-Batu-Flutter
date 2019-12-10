import 'package:flutter/material.dart';
import '../data/dimens.dart';
import '../data/constants.dart';

class AboutThanks extends StatelessWidget {

    Widget build(BuildContext context) {
        return Scaffold(
            body: Container(
                padding: EdgeInsets.all(Dimens.itemChangelogPadding),
                child: Text(Constants.thanks, style: TextStyle(
                    fontSize: 14.0
                ))
            )
        );
    }

}
