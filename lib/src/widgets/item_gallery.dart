import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../data/constants.dart';

class ItemGallery extends StatelessWidget {

    final String imageUrl;

    ItemGallery({this.imageUrl});

    Widget build(BuildContext context) {
        return InkWell (
            onTap: () {
                print('go to detail gallery');
                Navigator.pushNamed(context, '/detailGallery');
            },
            child: CachedNetworkImage(
                imageUrl: imageUrl,
                placeholder: (context, url) => Image.asset(Constants.placeHolderImage, fit: BoxFit.cover),
                errorWidget: (context, url, error) => Icon(Icons.error)
            )
        );
    }

}
