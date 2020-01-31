import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/constants.dart';
import '../models/gallery/item_gallery_model.dart';

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