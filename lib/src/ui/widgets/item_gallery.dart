import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:info_malang_batu_flutter/src/core/models/gallery/item_gallery_model.dart';
import 'package:info_malang_batu_flutter/src/data/constants.dart';

class ItemGallery extends StatelessWidget {

    const ItemGallery({this.itemGalleryModel});

    final ItemGalleryModel itemGalleryModel;

    @override
    Widget build(BuildContext context) {
        return InkWell (
            onTap: () {
                print('go to detail gallery');
                Navigator.pushNamed(context, '/detailGallery', arguments: itemGalleryModel);
            },
            child: CachedNetworkImage(
                imageUrl: itemGalleryModel.thumbnail,
                placeholder: (BuildContext context, String url) => Image.asset(placeHolderImage, fit: BoxFit.cover),
                errorWidget: (BuildContext context, String url, Object error) => Icon(Icons.error)
            )
        );
    }

}