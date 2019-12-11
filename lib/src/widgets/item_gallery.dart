import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/constants.dart';
import '../models/item_gallery_model.dart';

class ItemGallery extends StatelessWidget {

    final ItemGalleryModel itemGalleryModel;

    ItemGallery({this.itemGalleryModel});

    Widget build(BuildContext context) {
        return InkWell (
            onTap: () {
                print('go to detail gallery');
                Navigator.pushNamed(context, '/detailGallery', arguments: itemGalleryModel);
            },
            child: CachedNetworkImage(
                imageUrl: itemGalleryModel.thumbnail,
                placeholder: (context, url) => Image.asset(Constants.placeHolderImage, fit: BoxFit.cover),
                errorWidget: (context, url, error) => Icon(Icons.error)
            )
        );
    }

}
