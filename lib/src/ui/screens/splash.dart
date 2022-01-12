import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';
import 'package:info_malang_batu_flutter/src/ui/screens/home.dart';

class Splash extends StatelessWidget {

    @override
    Widget build(BuildContext context) {

        Future<void>.delayed(const Duration(seconds: 2), (){
            Navigator.pushNamedAndRemoveUntil(context, Home.routeHome, ModalRoute.withName('/'));
        });

        return Scaffold(
            body: Container(
                color: Colors.teal,
                child: Stack(
                    children: <Widget>[
                        Center(
                            child: Text('Info Malang Batu', style: TextStyle(
                                fontSize: 24.0,
                                fontFamily: 'Pacifico',
                                color: Colors.white
                            ))
                        ),
                        Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                                padding: const EdgeInsets.only(bottom: 16.0),
                                child: Text('versi $appVersion', style: TextStyle(
                                    fontSize: 14.0,
                                    color: Colors.white
                                ))
                            )
                        )
                    ]
                )
            )
        );
    }

}