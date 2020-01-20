import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/constants.dart';
import '../data/dimens.dart';
import '../models/gallery/item_gallery_model.dart';

class GalleryDetail extends StatelessWidget {

    const GalleryDetail({Key key, @required this.itemGalleryModel}): super(key: key);

    final ItemGalleryModel itemGalleryModel;

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Detail Galeri', style: TextStyle(
                    fontFamily: 'Pacifico'
                )),
            ),
            body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                    SizedBox(
                        width: double.infinity,
                        height: imageDetailHeight,
                        child: CachedNetworkImage(
                            imageUrl: itemGalleryModel.image,
                            fit: BoxFit.cover,
                            placeholder: (BuildContext context, String url) => Image.asset(placeHolderImage, fit: BoxFit.cover),
                            errorWidget: (BuildContext context, String url, Object error) => Icon(Icons.error)
                        )
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 8.0, left: 8.0, right: 8.0),
                        child: Text(itemGalleryModel.caption,
                            style: const TextStyle(fontSize: 16.0,),
                            textAlign: TextAlign.start
                        )
                    )
                ]
            )
        );
    }

}
