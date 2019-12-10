import 'package:flutter/material.dart';

class ListPlaceDetail extends StatelessWidget {

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Detail Lokasi', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
            ),
            body: Center(
                child: Text('Detail Lokasi')
            ),
        );
    }

}
