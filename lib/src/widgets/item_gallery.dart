import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemGallery extends StatelessWidget {

    final String imageUrl;

    ItemGallery({this.imageUrl});

    Widget build(BuildContext context) {
        return CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => Image.asset('assets/images/placeholder_image.png', fit: BoxFit.cover),
            errorWidget: (context, url, error) => Icon(Icons.error)
        );
    }

}
