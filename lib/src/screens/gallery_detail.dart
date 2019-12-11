import 'package:flutter/material.dart';
import '../models/item_gallery_model.dart';

class GalleryDetail extends StatelessWidget {

    final ItemGalleryModel itemGalleryModel;

    const GalleryDetail({Key key, @required this.itemGalleryModel}): super(key: key);

    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: Text('Detail Galeri', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
            ),
            body: Center(
                child: Text(itemGalleryModel.caption)
            ),
        );
    }

}
