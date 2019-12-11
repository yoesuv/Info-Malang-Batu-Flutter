import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../models/item_gallery_model.dart';
import '../data/constants.dart';
import '../data/dimens.dart';

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
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        height: Dimens.imageDetailHeight,
                        child: CachedNetworkImage(
                            imageUrl: itemGalleryModel.image,
                            fit: BoxFit.cover,
                            placeholder: (context, url) => Image.asset(Constants.placeHolderImage, fit: BoxFit.cover),
                            errorWidget: (context, url, error) => Icon(Icons.error)
                        )
                    ),
                    Container(
                        padding: EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Text(itemGalleryModel.caption,
                            style: TextStyle(fontSize: 16.0,),
                            textAlign: TextAlign.start
                        )
                    )
                ]
            )
        );
    }

}
