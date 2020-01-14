import 'package:flutter/material.dart';
import '../data/constants.dart';
import '../data/dimens.dart';

class AboutInfo extends StatelessWidget {

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Column(
                children: <Widget>[
                    Container(
                        padding: EdgeInsets.only(top: itemChangelogPadding, bottom: itemChangelogPadding),
                        child: Text('Info Malang Batu', style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Pacifico'
                        ))
                    ),
                    Text('Versi $appVersion', style: const TextStyle(
                        fontSize: 14.0
                    )),
                    Container(
                        padding: EdgeInsets.only(top: itemChangelogPadding, bottom: itemChangelogPadding),
                        child: Text('Flutter Version', style: TextStyle(
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold
                        ))
                    ),
                    const Divider(),
                    Container(
                        padding: EdgeInsets.all(itemChangelogPadding),
                        child: const Text('https://github.com/yoesuv/Info-Malang-Batu-Flutter', style: TextStyle(
                            fontSize: 14.0
                        )),
                    )
                ]
            )
        );
    }

}
