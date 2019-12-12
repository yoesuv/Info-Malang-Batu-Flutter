import 'package:flutter/material.dart';
import '../data/dimens.dart';
import '../data/constants.dart';

class AboutInfo extends StatelessWidget {

    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: Dimens.itemChangelogPadding, bottom: Dimens.itemChangelogPadding),
                        child: Text('Info Malang Batu', style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico'
                        ))
                    ),
                    Text('Versi ${Constants.appVersion}', style: TextStyle(
                        fontSize: 14.0
                    )),
                    Container(
                        padding: EdgeInsets.only(top: Dimens.itemChangelogPadding, bottom: Dimens.itemChangelogPadding),
                        child: Text('Flutter Version', style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    Divider(),
                    Container(
                        padding: EdgeInsets.all(Dimens.itemChangelogPadding),
                        child: Text('https://github.com/yoesuv/Info-Malang-Batu-Flutter', style: TextStyle(
                            fontSize: 14.0
                        )),
                    )
                ]
            )
        );
    }

}
