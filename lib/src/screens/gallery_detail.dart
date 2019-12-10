import 'package:flutter/material.dart';

class GalleryDetail extends StatelessWidget {

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Detail Galeri', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
            ),
            body: Center(
                child: Text('Detail Galeri')
            ),
        );
    }

}
