import 'package:flutter/material.dart';
import '../data/constants.dart';
import 'home.dart';

class Splash extends StatelessWidget {

    Widget build(BuildContext context) {

        Future.delayed(Duration(seconds: 2), (){
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
                                padding: EdgeInsets.only(bottom: 8.0),
                                child: Text('versi ${Constants.appVersion}', style: TextStyle(
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
