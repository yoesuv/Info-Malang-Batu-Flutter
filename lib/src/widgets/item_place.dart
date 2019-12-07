import 'package:flutter/material.dart';
import '../models/item_place_model.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ItemPlace extends StatelessWidget {

    final ItemPlaceModel itemPlaceModel;

    ItemPlace({this.itemPlaceModel});

    Widget build(BuildContext context) {
        return Stack (
            children: <Widget>[
                SizedBox(
                    width: double.infinity,
                    height: 180.0,
                    child: CachedNetworkImage(
                        imageUrl: itemPlaceModel.gambar,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Image.asset('assets/images/placeholder_image.png', fit: BoxFit.cover),
                        errorWidget: (context, url, error) => Icon(Icons.error)
                    )
                ),
            ],
        );
    }

}
